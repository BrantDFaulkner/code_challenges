require_relative "../../app/models/board"

describe Board do
  subject(:board) { Board.new }

  describe "#check_for_win" do
    it "should return false if board has no winner" do
      board.matrix = [["X","O",nil],["X","X","O"],[nil, nil, "O"]]
      board.check_for_win
      expect(board.winner).to be(false)
    end

    it "should return true if board has a winner" do
      board.matrix = [["X","O",nil],[nil,"X","O"],[nil, nil, "X"]]
      board.check_for_win
      expect(board.winner).to be(true)
    end
  end#check_for_win

  describe "mark_space" do
    it "should mark accurately mark the board" do
      board.mark_space(3, "O")
      expect(board.matrix[1][0]).to eq("O")
    end

    it "should remove the space from #available_spaces" do
      board.mark_space(6, "O")
      expect(board.available_spaces).to eq([0,1,2,3,4,5,7,8])
    end
  end#mark_space

end#Board


