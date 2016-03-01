class Transaction
  attr_reader :amount, :day, :type

  def initialize(amount, day, type)
    @amount = validate_amount(amount)
    @day = validate_day(day)
    @type = validate_type(type)
  end

  def value
    withdrawal? ? amount : -amount
  end

  def payment?
    type == :payment
  end

  def withdrawal?
    type == :withdrawal
  end

  def validate_amount(amount)
    raise "#amount must be a number." unless amount.is_a?(Numeric)
    amount.to_f
  end

  def validate_day(day)
    raise "#day must be a number" unless day.is_a?(Numeric)
    raise "#day must be between 1 and 30 inclusive." unless day.between?(1, 30)
    day.to_i
  end

  def validate_type(type)
    raise "#type must be :payment or :withdrawal" unless [:payment, :withdrawal].include?(type)
    type
  end
end#Transaction