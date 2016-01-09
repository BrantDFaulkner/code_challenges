class Transaction
  attr_reader :amount, :day, :type

  def initialize(amount, day, type)
    @type = validate_type(type)
    @amount = validate_amount(amount)
    @day = validate_day(day)
  end

  def validate_amount(amount)
    if !amount.is_a?(Numeric)
      raise "#amount must be a number."
    else
      amount.to_f
    end
  end

  def validate_day(day)
    if !day.is_a?(Numeric)
      raise "#day must be a number"
    elsif !day.between?(1, 30)
      raise "#day must be between 1 and 30 inclusive."
    else
      day.to_i
    end
  end

  def validate_type(type)
    if ![:payment, :withdrawal].include?(type)
      raise "#type must be :payment or :withdrawal"
    else
      type
    end
  end


end