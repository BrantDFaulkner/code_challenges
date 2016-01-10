require_relative "classes/client"

# Scenario 1:
# Someone creates a line of credit for 1000$ and 35% APR.

# He draws 500$ on day one so his remaining credit limit is 500$ and his balance is 500$.

# He keeps the money drawn for 30 days.
# He should owe 500$ * 0.35 / 365 * 30 = 14.38$ worth of interest on day 30.
# Total payoff amount would be 514.38$

client = Client.new
credit_line = client.open_credit_line(1000, 35)
client.make_withdrawal(credit_line, 500, 1)

credit_line.update_interest_balance(30)
print "Clients's principle balance is 500: "
p 500.0 == credit_line.principle_balance
print "Client's interest balance is 14.38: "
p 14.38 == credit_line.interest_balance.round(2)



