require_relative "../../app/views/board_view"

describe BoardView do
  subject(:board_view) { BoardView.new }
  let(:board) { Board.new }
  let(:spaces) { board.available_spaces }
  let(:matrix) { board.matrix }

  describe "#display" do
    it "should display a board #header, #available_spaces, and #matrix" do
      expect(board_view).to receive(:header)
      expect(board_view).to receive(:available_spaces)
      expect(board_view).to receive(:matrix)
      board_view.display(board)
    end
  end

  describe "#available_spaces" do
    it "should convert #available_spaces a string and output it" do
      expect(board_view).to receive(:puts).with(/1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9/)
      board_view.available_spaces(spaces)
    end
  end

  describe "#matrix" do
    it "shoud convert #matrix to string and #puts" do
      expect(board_view).to receive(:puts).with("====+===+====\n| 1 | 2 | 3 |\n====+===+====\n| 4 | 5 | 6 |\n====+===+====\n| 7 | 8 | 9 |\n====+===+====")
      board_view.matrix(matrix)
    end
  end
end#BoardView