require_relative "transaction"

#!!!!!!!!!!!!!!!!!ADD no transaction over credit limit


class CreditLine
  attr_accessor :principle_balance, :interest_balance, :current_day, :transaction_history
  attr_reader :credit_limit, :apr

  def initialize(credit_limit, apr)
    @credit_limit = validate_credit_limit(credit_limit)
    @apr = validate_apr(apr)
    @principle_balance = 0.0
    @interest_balance = 0.0
    @transaction_history = []
  end

  def validate_credit_limit(credit_limit)
    if !credit_limit.is_a?(Numeric)
      raise "#credit_limit must be numeric."
    elsif credit_limit > 10000
      raise "#credit_limit over 10000 requires special authorization."
    else
      credit_limit.to_f
    end
  end

  def validate_apr(apr)
    if !apr.is_a?(Numeric)
      raise "#apr must be numeric."
    elsif !apr.between?(0, 100)
      raise "#apr must be between 0 and 100 inclusive."
    else
      apr/100.0
    end
  end

  def import_transaction(transaction)
    if transaction_history.last && transaction.day <= transaction_history.last.day
      self.transaction_history.sort! { |a,b| a.day <=> b.day}
    end
      self.transaction_history << transaction
  end

  def update_principle_balance
    return 0 if transaction_history.empty?
    self.principle_balance = transaction_history.map(&:value).reduce(:+)
  end

  def update_interest_balance(final_day)#!!!!!!!NOT TESTED
    return 0 if transaction_history.empty?
    last_day = 0
    transaction_history.each do |t|
      self.interest_balance += day_of_transaction_adjustment(t)
      period_length = t.day - last_day
      last_day = t.day
      self.interest_balance += principle_balance * apr * (period_length/365.0)
      self.principle_balance += t.value
    end
    final_period_length = final_day - last_day
    self.interest_balance += principle_balance * apr * (final_period_length/365.0)
  end

  def daily_interest(transaction)
    (transaction.amount * apr) / 365.0
  end

  def day_of_transaction_adjustment(transaction)
    transaction.withdrawal? ? daily_interest(transaction) : -(daily_interest(transaction)/2.0)
  end

end#CreditLine