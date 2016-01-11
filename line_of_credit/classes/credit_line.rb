require_relative "transaction"

class CreditLine
  attr_accessor :principle_balance, :interest_balance, :transaction_history, :remaining_credit, :last_transaction_day
  attr_reader :credit_limit, :apr

  def initialize(credit_limit, apr)
    validate_arguments(credit_limit, apr)
    @credit_limit = credit_limit.to_f
    @apr = apr/100.0
    @principle_balance = 0.0
    @interest_balance = 0.0
    @remaining_credit = credit_limit
    @transaction_history = []
    @last_transaction_day = 0
  end

  def import_transaction(transaction)
    validate_transaction(transaction)
    self.transaction_history << transaction
    update_balances(transaction)
  end

  def current_statement(current_day)
    statement = {
      credit_limit: credit_limit.round(2),
      apr: apr,
      principle_balance: principle_balance.round(2),
      interest_balance: (interest_balance + recent_interest(current_day)).round(2),
      total_balance: (principle_balance + interest_balance + recent_interest(current_day)).round(2),
      remaining_credit: (remaining_credit - recent_interest(current_day)).round(2)
    }
  end

private
#validate_arguments
  def validate_arguments(credit_limit, apr)
    validate_credit_limit(credit_limit)
    validate_apr(apr)
  end

  def validate_credit_limit(credit_limit)
    raise "#credit_limit must be numeric." unless credit_limit.is_a?(Numeric)
    raise "#credit_limit over 10000 requires special authorization." unless credit_limit <= 10000
  end

  def validate_apr(apr)
    raise "#apr must be numeric." unless apr.is_a?(Numeric)
    raise "#apr must be between 0 and 100 inclusive." unless apr.between?(0, 100)
  end
#validate_transaction
  def validate_transaction(transaction)
    raise "#withdrawal would violate credit_limit" if transaction.withdrawal? &&over_credit_limit?(transaction)
    raise "#payment would create a negative balance" if transaction.payment? && over_payment?(transaction)
  end

  def over_credit_limit?(transaction)
    transaction.value > remaining_credit - recent_interest(transaction.day)
  end

  def over_payment?(transaction)
    transaction.value.abs > principle_balance + interest_balance + recent_interest(transaction.day)
  end
#update_balance
  def update_balances(transaction)
    if transaction_history.length == 1
      self.principle_balance = transaction.value
      self.interest_balance += recent_interest(transaction.day)
    else
      self.interest_balance += recent_interest(transaction.day)
      self.principle_balance += transaction.value
    end
    self.last_transaction_day = transaction.day
    self.remaining_credit = credit_limit - principle_balance - interest_balance
  end

  def daily_interest
    (principle_balance * apr) / 365.0
  end

  def accumulation_period(current_day)
    current_day - last_transaction_day
  end

  def recent_interest(current_day)
    daily_interest * accumulation_period(current_day)
  end

end#CreditLine