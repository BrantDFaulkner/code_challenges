require_relative "classes/client"

# Scenario 2:
# Someone creates a line of credit for 1000$ and 35% APR.

# He draws 500$ on day one so his remaining credit limit is 500$ and his balance is 500$.

# He pays back 200$ on day 15 and then draws another 100$ on day 25.

# His total owed interest on day 30 should be 500 * 0.35 / 365 * 15 + 300 * 0.35 / 365 * 10 + 400 * 0.35 / 365 * 5  which is 11.99.  Total payment should be 411.99.

client = Client.new
credit_line = client.open_credit_line(1000, 35)
client.make_withdrawal(credit_line, 500, 1)
client.make_payment(credit_line, 200, 15)
client.make_withdrawal(credit_line, 100, 25)

credit_line.update_interest_balance(30)
print "Clients's principle balance is 400: "
p 400.0 == credit_line.principle_balance
print "Client's interest balance is 11.99: "
p 11.99 == credit_line.interest_balance.round(2)

