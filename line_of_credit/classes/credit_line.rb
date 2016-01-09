class CreditLine
  attr_accessor :principle_balance, :interest_balance
  attr_reader :credit_limit, :apr

  def initialize(credit_limit, apr)
    @credit_limit = validate_credit_limit(credit_limit)
    @apr = validate_apr(apr)
    @principle_balance = 0.0
    @interest_balance = 0.0
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

end#CreditLine