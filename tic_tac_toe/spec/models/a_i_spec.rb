require_relative "../../app/models/a_i"

describe AI do
  subject(:ai) { AI.new(matrix, marker)}
  let(:matrix) { [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]] }
  let(:marker) {"X"}

  describe "#move" do
    it "should return an unexploitable move" do
      expect(ai.move).to be_a(Integer)
    end
  end

end#AI
