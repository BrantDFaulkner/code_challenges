require_relative "../classes/client"

describe "Client" do
  let(:client) { Client.new }
  let(:credit_line) { CreditLine.new(200, 15) }
  describe "#open_credit_line" do
    it "should respond to #open_credit_line" do
      expect(client).to respond_to(:open_credit_line)
    end

    it "should create a new CreditLine" do
      expect(client.open_credit_line(500, 10).class).to be(CreditLine)
    end
  end#open_credit_line

  describe "#make_payment" do
    it "should respond to #make_payment" do
      expect(client).to respond_to(:make_payment)
    end

    it "should make a payment transaction to the credit_line" do
      client.make_payment(credit_line, 100, 5)
      history = credit_line.transaction_history
      expect(history.length).to be(2)
      expect(history[1].withdrawal?).to be_falsey
    end
  end#make_payment

  describe "#make_withdrawal" do
    it "should respond to #make_withdrawal" do
      expect(client).to respond_to(:make_withdrawal)
    end

    it "should make a payment transaction to the credit_line" do
      client.make_withdrawal(credit_line, 100, 5)
      history = credit_line.transaction_history
      expect(history.length).to be(2)
      expect(history[0].withdrawal?).to be_truthy
    end
  end#make_withdrawal
end#Client