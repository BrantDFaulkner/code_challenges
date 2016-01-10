require_relative "../../classes/client"

# Scenario 1:
# Someone creates a line of credit for 1000$ and 35% APR.

# He draws 500$ on day one so his remaining credit limit is 500$ and his balance is 500$.

# He keeps the money drawn for 30 days.
# He should owe 500$ * 0.35 / 365 * 30 = 14.38$ worth of interest on day 30.
# Total payoff amount would be 514.38$

describe "scenario_1" do
  client = Client.new
  credit_line = client.open_credit_line(1000, 35)
  client.make_withdrawal(credit_line, 500, 1)
  statement = credit_line.current_statement(30)

  context "30 Day Statement" do
    describe "#principle_balance" do
      it "should be 500.0" do
        expect(statement[:principle_balance]).to equal(500.0)
      end
    end

    describe "#interest_balance" do
      it "should be 14.38" do
        expect(statement[:interest_balance]).to equal(14.38)
      end
    end

    describe "#total_balance" do
      it "should be 514.38" do
        expect(statement[:total_balance]).to equal(514.38)
      end
    end

    describe "#remaining_credit" do
      it "should be 485.62" do
        expect(statement[:remaining_credit]).to equal(485.62)
      end
    end

  end#context
end#scenario_1