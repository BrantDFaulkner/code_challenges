require_relative "../classes/credit_line"
require_relative "../classes/transaction"


describe "CreditLine" do
  let(:credit_line) { CreditLine.new(1000, 35) }
  describe "#initialize" do
    describe '#credit_limit' do
      it "should respond to #credit_limit" do
        expect(credit_line).to respond_to(:credit_limit)
      end

      it "should raise error if amount is invalid" do
        expect { CreditLine.new("invalid", 35) }.to raise_error(RuntimeError)
      end

      it "should raise error if amount is over 10000" do
        expect { CreditLine.new(100000, 35) }.to raise_error(RuntimeError)
      end
    end#credit_limit

    describe '#apr' do
      it "should respond to #apr" do
        expect(credit_line).to respond_to(:apr)
      end

      it "should raise error if apr is invalid" do
        expect { CreditLine.new(1000, "invalid") }.to raise_error(RuntimeError)
      end

      it "should raise error if apr is outside range 0-100" do
        expect { CreditLine.new(1000, 150) }.to raise_error(RuntimeError)
      end
    end#apr

    describe '#principle_balance' do
      it "should respond to #principle_balance" do
        expect(credit_line).to respond_to("principle_balance")
      end

      it "should be zero" do
        expect(credit_line.principle_balance).to equal(0.0)
      end
    end#principle_balance

    describe '#interest_balance' do
      it "should respond to #interest_balance" do
        expect(credit_line).to respond_to("interest_balance")
      end

      it "should be zero" do
        expect(credit_line.interest_balance).to equal(0.0)
      end
    end#interest_balance

    describe "#transaction_history" do
      it "should be empty" do
        expect(credit_line.transaction_history.empty?).to be_truthy
      end
    end#transaction_history
  end#initialize

  context "make three transactions" do
    credit_line = CreditLine.new(1000, 35)
    transactions = [
      Transaction.new(500, 1, :withdrawal),
      Transaction.new(100, 5, :payment),
      Transaction.new(200, 25, :withdrawal)
    ]
    transactions.each { |t| credit_line.import_transaction(t)}

    describe "#import_transaction" do
      it "should add a transaction to the #transaction_history" do
        expect(credit_line.transaction_history.length).to equal(3)
      end
    end#import_transaction

    # describe "#update_principle_balance" do
    #   it "should set #principle_balance to the sum of the transactions" do
    #     credit_line.update_principle_balance
    #     expect(credit_line.principle_balance).to equal(600.0)
    #   end
    # end

    # describe "#update_interest_balance" do
    #   it "should update the interest balance at a specific day"
    #   credit_line.update_interest_balance(30)
    # end


  end#context
end#Transaction