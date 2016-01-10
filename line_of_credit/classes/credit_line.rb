require_relative "transaction"

class CreditLine
  attr_accessor :principle_balance, :interest_balance, :current_day, :transaction_history, :remaining_credit
  attr_reader :credit_limit, :apr

  def initialize(credit_limit, apr)
    @credit_limit = validate_credit_limit(credit_limit)
    @apr = validate_apr(apr)
    @principle_balance = 0.0
    @interest_balance = 0.0
    @remaining_credit = credit_limit#WRITE SPECS
    @transaction_history = [Transaction.new(0, 1, :withdrawal)]
  end

  def import_transaction(transaction)
    # sort_transaction_history if transaction.day <= transaction_history.last.day
    self.transaction_history << validate_transaction(transaction)
    update_balances(transaction)
  end

  # def update_principle_balance
  #   return 0 if transaction_history.empty?
  #   self.principle_balance = transaction_history.map(&:value).reduce(:+)
  # end

  def update_balances(transaction)#WRITE SPECS
      # self.interest_balance += day_of_transaction_adjustment(t)
      self.interest_balance += recent_interest(transaction.day)
      self.principle_balance += transaction.value
      self.remaining_credit = credit_limit - principle_balance - interest_balance
  end

  def current_statment(current_day)#WRITE SPECS
    {credit_limit: credit_limit,
    apr: apr,
    principle_balance: principle_balance,
    interest_balance: interest_balance + recent_interest(current_day),
    remaining_credit: remaining_credit - recent_interest(current_day)}
  end

  def recent_interest(current_day)#WRITE SPECS
    daily_interest * accumulation_period(current_day)
  end

  def accumulation_period(current_day)#WRITE SPECS
    current_day - transaction_history.last.day
  end

  def update_interest_balance(final_day)
    transaction_history.each do |t|
      # self.interest_balance += day_of_transaction_adjustment(t)
      # period_length = t.day - last_day
      # last_day = t.day
      # self.interest_balance += principle_balance * apr * (period_length/365.0)
      # self.principle_balance += t.value
    end
    # final_period_length = final_day - last_day
    # self.interest_balance += principle_balance * apr * (final_period_length/365.0)
  end

  def daily_interest#WRITE SPECS
    (principle_balance * apr) / 365.0
  end

  def transaction_day_adjustment(transaction)#WRITE SPECS
    transaction.withdrawal? ? daily_interest(transaction) : -(daily_interest(transaction)/2.0)
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