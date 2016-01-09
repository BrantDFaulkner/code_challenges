require_relative "../classes/transaction"

describe "Transaction" do
  let(:transaction) { Transaction.new(true, 100, 20) }
  describe "#initialize" do
    describe '#credit' do
      it "should respond to #type" do
        expect(transaction).to respond_to(:credit)
      end

      it "should be a boolean " do
        expect([true, false]).to include(transaction.credit)
      end
    end#credit

    describe '#amount' do
      it "should respond to #amount" do
        expect(transaction).to respond_to(:amount)
      end

      it "should be a Fixnum" do
        expect(transaction.amount).to be_a(Fixnum)
      end
    end#amount

    describe '#day' do
      it "should respond to #day" do
        expect(transaction).to respond_to(:day)
      end

      it "should be a Fixnum" do
        expect(transaction.day).to be_a(Fixnum)
      end
    end#day

  end#initialize


end#Transaction