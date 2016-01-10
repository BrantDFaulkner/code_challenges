require_relative "../classes/transaction"

describe "Transaction" do
  let(:transaction) { Transaction.new(100, 1, :withdrawal) }
  describe "#initialize" do
    describe '#amount' do
      it "should respond to #amount" do
        expect(transaction).to respond_to(:amount)
      end

      it "should raise error if amount is invalid" do
        expect { Transaction.new("invalid", 1, :withdrawal) }.to raise_error(RuntimeError)
      end
    end#amount

    describe '#day' do
      it "should respond to #day" do
        expect(transaction).to respond_to(:day)
      end

      it "should raise error if day is invalid" do
        expect { Transaction.new(100, "invalid", :payment) }.to raise_error(RuntimeError)
      end

      it "should raise error if day is outside 1-30" do
        expect { Transaction.new(100, 100, :payment) }.to raise_error(RuntimeError)
      end
    end#day

    describe '#type' do
      it "should respond to #type" do
        expect(transaction).to respond_to(:type)
      end

      it "should raise error if type is invalid" do
          expect { Transaction.new(100, 25, "invalid") }.to raise_error(RuntimeError)
      end
    end#type
  end#initialize

  describe '#value' do
    it "should respond to #value" do
      expect(transaction).to respond_to(:value)
    end

    it "should return numeric" do
      expect(transaction.value).to be_a(Numeric)
    end
  end#value

  context "transaction is a :payment" do
    transaction = Transaction.new(100, 5, :payment)
    describe '#payment?' do
      it "should return true" do
        expect(transaction.payment?).to be_truthy
      end
    end#payment?

    describe '#withdrawal?' do
      it "should return true" do
        expect(transaction.withdrawal?).to be_falsey
      end
    end#withdrawal?
  end#context

end#Transaction