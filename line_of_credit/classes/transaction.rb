class Transaction
  attr_reader :credit, :amount, :day

  def initialize(credit, amount, day)
    @credit = credit
    @amount = amount
    @day = day
  end


end