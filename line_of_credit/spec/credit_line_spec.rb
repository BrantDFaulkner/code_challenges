require_relative "../classes/credit_line"
require_relative "../classes/transaction"

describe "CreditLine" do
  let(:credit_line) { CreditLine.new(1000, 35) }
  let(:transaction) { Transaction.new(500, 10, :withdrawal) }
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

      it "should be 0.0" do
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

  describe "#import_transaction" do
    describe "#validate_transaction" do
      describe "#over_credit_limit?" do
        it "should return true" do
          transaction = Transaction.new(5000, 10, :withdrawal)
          expect(credit_line.send(:over_credit_limit?, transaction)).to be_truthy
        end

        it "should return false" do
          transaction = Transaction.new(500, 10, :withdrawal)
          expect(credit_line.send(:over_credit_limit?, transaction)).to be_falsey
        end
      end#over_credit_limit

      describe "#over_payment?" do
        it "should return true" do
          transaction = Transaction.new(5000, 10, :payment)
          expect(credit_line.send(:over_payment?, transaction)).to be_truthy
        end

        it "should return true" do
          transaction = Transaction.new(0, 10, :payment)
          expect(credit_line.send(:over_payment?, transaction)).to be_falsey
        end
      end#over_payment
    end#validate_transaction

    it "should call #validate_transaction" do
      expect(credit_line).to receive(:validate_transaction).with(transaction)
      credit_line.send(:validate_transaction, transaction)
    end

    it "should add a transaction to #transaction_history" do
      credit_line.import_transaction(transaction)
      expect(credit_line.transaction_history.empty?).to be_falsey
    end

    it "should call #update_balances" do
      expect(credit_line).to receive(:update_balances).with(transaction)
      credit_line.send(:update_balances, transaction)
    end
  end#import_transaction

end#CreditLine