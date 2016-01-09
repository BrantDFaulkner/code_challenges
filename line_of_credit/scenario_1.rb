require_relative "classes/client"

# Scenario 1:
# Someone creates a line of credit for 1000$ and 35% APR.

# He draws 500$ on day one so his remaining credit limit is 500$ and his balance is 500$.

# He keeps the money drawn for 30 days.
# He should owe 500$ * 0.35 / 365 * 30 = 14.38$ worth of interest on day 30.
# Total payoff amount would be 514.38$

# client = Client.new("John Doe")


credit_line = CreditLine.new(1000, 35)
transaction = Transaction.new(500, 1, :withdrawal)


credit_line.import_transaction(transaction)
credit_line.update_interest_balance(30)
p credit_line

# p a = (500 * 0.35) * (30/365.0)
# p b = (500 * 0.35) * (1/365.0)


