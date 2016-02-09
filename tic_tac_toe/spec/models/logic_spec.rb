require_relative "../../app/models/logic"

describe Logic do
  subject(:logic) { Logic.new(matrix, marker)}
  let(:matrix) { [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]] }
  let(:marker) {"X"}

  describe "#first_move" do
    context "if all spaces are available" do
      it "shoud return all available spaces" do
        expect(logic.first_move.sort).to eq([0,1,2,3,4,5,6,7,8])
      end
    end

    context "if all spaces are not available" do
      let(:matrix) { [["X","O","X"],["O","X","O"],[nil,nil,nil]] }
      it "shoud return no spaces" do
        expect(logic.first_move).to eq([])
      end
    end
  end#first_move

  describe "#winning_moves" do
    context "when a winning space exists" do
      let(:matrix) { [["X","O","X"],["O","X","O"],[nil,nil,nil]] }
      it "should return all winning spaces" do
        expect(logic.winning_moves).to eq([6,8])
      end
    end

    context "when no winning space exists" do
      let(:matrix) { [["X","O","X"],[nil,nil,"O"],[nil,nil,nil]] }
      it "should return no spaces" do
        expect(logic.winning_moves).to eq([])
      end
    end
  end#winning_moves

  describe "#block_win" do
    context "when opponent has a winning space" do
      let(:matrix) { [["X",nil,nil],["O","O",nil],[nil,nil,"X"]] }
      it "should return a space to block the win" do
        expect(logic.block_win).to eq([5])
      end
    end

    context "when opponent does not have a winning space" do
      let(:matrix) { [["X",nil,nil],["O",nil,nil],[nil,nil,nil]] }
      it "should return no spaces" do
        expect(logic.block_win).to eq([])
      end
    end
  end#block_win

  describe "#trap_moves" do
    context "when player can create a trap" do
      let(:matrix) { [["X","O","X"],["O",nil,nil],[nil,nil,nil]] }
      it "should return spaces that create a trap" do
        expect(logic.trap_moves).to eq([4,8])
      end
    end

    context "when player cannot make a trap" do
      let(:matrix) { [["X","O","X"],[nil,"O",nil],[nil,nil,nil]] }
      it "should return no spaces" do
        expect(logic.trap_moves).to eq([])
      end
    end
  end#trap_moves

  describe "#block_trap" do
    context "when opponent has no trap spaces" do
      it "should return no spaces" do
        expect(logic.block_trap).to eq([])
      end
    end

    context "when opponent has a single trap space" do
      let(:matrix) { [["X",nil,"O"],[nil,nil,"X"],[nil,nil,"O"]] }
      it "should return a space to block trap" do
        expect(logic.block_trap).to eq([6])
      end
    end

    context "when opponent has multiple trap spaces" do
      let(:marker) { "O"}
      let(:matrix) { [["X",nil,nil],[nil,"O",nil],[nil,nil,"X"]] }
      it "should return a space that forces opponent to block win and not create trap" do
        expect(logic.block_trap).to eq([1,3,5,7])
      end
    end
  end#block_trap

  describe "#center" do
    context "when center space is available" do
      it "should return the center space" do
        expect(logic.center).to eq([4])
      end
    end

    context "when center space is unavailable" do
      let(:matrix) { [["X","O",nil],[nil,"O",nil],[nil,nil,"X"]] }
      it "should return no spaces" do
        expect(logic.center).to eq([])
      end
    end
  end#center

  describe "#empty_corner" do
    context "when a corner space is available" do
      let(:matrix) {[["O",nil,nil],[nil,nil,nil],[nil,nil,nil]]}
      it "should return available corner spaces" do
        expect(logic.empty_corner).to eq([2,6,8])
      end
    end

    context "when a corner space is not available" do
      let(:matrix) {[["O",nil,"X"],[nil,nil,nil],["X",nil,"O"]]}
      it "should return no spaces" do
        expect(logic.empty_corner).to eq([])
      end
    end
  end#empty_corner

  describe "#empty_side" do
    context "when a side space is available" do
      let(:matrix) {[[nil,"O",nil],[nil,nil,nil],[nil,nil,nil]]}
      it "should return available side spaces" do
        expect(logic.empty_side).to eq([3,5,7])
      end
    end

    context "when a side space is not available" do
      let(:matrix) {[[nil,"X",nil],["O",nil,"X"],[nil,"O",nil]]}
      it "should return no spaces" do
        expect(logic.empty_side).to eq([])
      end
    end
  end#empty_side

end#Logic