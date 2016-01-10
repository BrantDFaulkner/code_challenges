require_relative "../../classes/client"

# Scenario 2:
# Someone creates a line of credit for 1000$ and 35% APR.

# He draws 500$ on day one so his remaining credit limit is 500$ and his balance is 500$.

# He pays back 200$ on day 15 and then draws another 100$ on day 25.

# His total owed interest on day 30 should be 500 * 0.35 / 365 * 15 + 300 * 0.35 / 365 * 10 + 400 * 0.35 / 365 * 5  which is 11.99.  Total payment should be 411.99.

describe "scenario_2" do
  client = Client.new
  credit_line = client.open_credit_line(1000, 35)
  client.make_withdrawal(credit_line, 500, 1)
  client.make_payment(credit_line, 200, 15)
  client.make_withdrawal(credit_line, 100, 25)
  statement = credit_line.current_statement(30)

  context "30 Day Statement" do
    describe "#principle_balance" do
      it "should be 400" do
        expect(statement[:principle_balance]).to equal(400.0)
      end
    end

    describe "#interest_balance" do
      it "should be 11.99" do
        expect(statement[:interest_balance]).to equal(11.99)
      end
    end

    describe "#total_balance" do
      it "should be 411.99" do
        expect(statement[:total_balance]).to equal(411.99)
      end
    end
    describe "#remaining_credit" do
      it "should be 588.01" do
        expect(statement[:remaining_credit]).to equal(588.01)
      end
    end
  end#context
end#scenariou_2