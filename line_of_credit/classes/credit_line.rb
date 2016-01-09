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
      apr.to_f
    end
  end

  def import_transaction(transaction)
    self.transaction_history << transaction
  end

  def update_principle_balance
    transaction_history.map do |transaction|
      if transaction.type == :withdrawal
        transaction.amount
      else
        -transaction.amount
      end
    end.reduce(:+)
  end

  # current_principle = principle_balance
  #   # current_interest = interest_balance

  #   # #update principle
  #   # if transaction.type == :payment
  #   #   adjusted_principle = current_principle - transaction.amount
  #   # end

  #   # #update interest

  def generate_thirty_day_statement

  end

end#CreditLine