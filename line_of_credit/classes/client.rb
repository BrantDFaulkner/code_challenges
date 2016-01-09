def Client
  def inititalize(name)
    @name = name
  end

  def make_payment(amount, account, day)
    transaction = Transaction.new(amount, day, :payment)
    account.import_transaction(transaction)
  end

  def make_withdrawal(amount, account)

  end

end