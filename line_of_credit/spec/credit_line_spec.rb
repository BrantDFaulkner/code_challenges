require_relative "../classes/credit_line"

describe "CreditLine" do
  # let(:credit_line) { CreditLine.new(1000, 35) }
  describe "#initialize" do
    credit_line = CreditLine.new(1000, 35)
    describe '#credit_limit' do
      it "should respond to #type" do
        expect(credit_line).to respond_to(:credit_limit)
      end

      it "should be a Float " do
        expect(credit_line.credit_limit).to be_a(Float)
      end
    end#credit_limit

    describe '#apr' do
      it "should respond to #apr" do
        expect(credit_line).to respond_to(:apr)
      end

      it "should be a Float " do
        expect(credit_line.apr).to be_a(Float)
      end
    end#apr

    describe '#principle_balance' do
      it "should respond to #principle_balance" do
        expect(credit_line).to respond_to("principle_balance")
      end

      it "should be zero" do
        expect(credit_line.principle_balance).to eql(0.0)
      end
    end#principle_balance

    describe '#interest_balance' do
      it "should respond to #interest_balance" do
        expect(credit_line).to respond_to("interest_balance")
      end

      it "should be zero" do
        expect(credit_line.interest_balance).to eql(0.0)
      end
    end#interest_balance


  end#initialize
end#Transaction