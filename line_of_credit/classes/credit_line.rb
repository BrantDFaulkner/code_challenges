class CreditLine
  attr_accessor :principle_balance, :interest_balance
  attr_reader :credit_limit, :apr

  def initialize(credit_limit, apr)
    @credit_limit = credit_limit.to_f
    @apr = apr.to_f
    @principle_balance = 0.0
    @interest_balance = 0.0
  end

end#CreditLine