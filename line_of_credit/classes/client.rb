require_relative "credit_line"

class Client

  def open_credit_line(credit_limit, apr)
    CreditLine.new(credit_limit, apr)
  end

  def make_payment(credit_line, amount, day)
    transaction = Transaction.new(amount, day, :payment)
    credit_line.import_transaction(transaction)
  end

  def make_withdrawal(credit_line, amount, day)
    transaction = Transaction.new(amount, day, :withdrawal)
    credit_line.import_transaction(transaction)
  end

end#Client