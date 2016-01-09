require_relative "../classes/credit_line"

describe "CreditLine" do
  let(:credit_line) { CreditLine.new(1000, 35) }
  describe "#initialize" do
    describe '#credit_limit' do
      it "should respond to #type" do
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