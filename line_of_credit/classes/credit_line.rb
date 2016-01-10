require_relative "transaction"

class CreditLine
  attr_accessor :principle_balance, :interest_balance, :current_day, :transaction_history, :remaining_credit, :last_transaction_day
  attr_reader :credit_limit, :apr

  def initialize(credit_limit, apr)
    @credit_limit = validate_credit_limit(credit_limit)
    @apr = validate_apr(apr)
    @principle_balance = 0.0
    @interest_balance = 0.0
    @remaining_credit = credit_limit#WRITE SPECS
    @transaction_history = []
    @last_transaction_day = 0
  end

  def import_transaction(transaction)
    self.transaction_history << validate_transaction(transaction)
    if transaction_history.length == 1
      self.principle_balance = transaction.value
      self.interest_balance += recent_interest(transaction.day)
      self.remaining_credit = credit_limit - principle_balance - interest_balance
      self.last_transaction_day = transaction.day
    else
      update_balances(transaction)
    end
  end

  def update_balances(transaction)#WRITE SPECS
    self.interest_balance += recent_interest(transaction.day)
    self.principle_balance += transaction.value
    self.remaining_credit = credit_limit - principle_balance - interest_balance
    self.last_transaction_day = transaction.day
  end

  def recent_interest(current_day)#WRITE SPECS
    daily_interest * accumulation_period(current_day)
  end

  def accumulation_period(current_day)#WRITE SPECS
    current_day - last_transaction_day
  end

  def daily_interest#WRITE SPECS

    (principle_balance * apr) / 365.0
  end

  def current_statement(current_day)
    {credit_limit: credit_limit.round(2),
    apr: apr,
    principle_balance: principle_balance.round(2),
    interest_balance: (interest_balance + recent_interest(current_day)).round(2),
    total_balance: (principle_balance + interest_balance + recent_interest(current_day)).round(2),
    remaining_credit: (remaining_credit - recent_interest(current_day)).round(2)}
  end

private
#VALIDATIONS
  def validate_credit_limit(credit_limit)
    raise "#credit_limit must be numeric." unless credit_limit.is_a?(Numeric)
    raise "#credit_limit over 10000 requires special authorization." unless credit_limit <= 10000
    credit_limit.to_f
  end

  def validate_apr(apr)
    raise "#apr must be numeric." unless apr.is_a?(Numeric)
    raise "#apr must be between 0 and 100 inclusive." unless apr.between?(0, 100)
    apr/100.0
  end

  def validate_transaction(transaction)
    raise "#withdrawal would violate credit_limit" unless true#Write #over_credit_limit?
    raise "#payment would create a negative balance" unless true#Write #over_payment?
    transaction
  end

  def sort_transaction_history
    self.transaction_history.sort! { |a,b| a.day <=> b.day }
  end

end#CreditLine