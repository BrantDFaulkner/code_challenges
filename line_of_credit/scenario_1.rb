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

statement = credit_line.current_statement(30)

puts "Client's total balance should be $514.38."
puts "Statement: #{statement[:total_balance]}"
puts "Clients's principle balance should be 500."
puts "Statement: #{statement[:principle_balance]}"
puts "Client's interest_balance should be $14.38."
puts "Statement: #{statement[:interest_balance]}"
puts "Client's remaining credit should be $485.62."
puts "Statement: #{statement[:remaining_credit]}"




