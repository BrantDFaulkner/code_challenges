def Client
  def inititalize(name)
    @name = name
  end

  def make_payment(credit_line, amount, day)
    transaction = Transaction.new(amount, day, :payment)
    account.import_transaction(transaction)
  end

  def make_withdrawal(credit_line, amount, day)

  end

end