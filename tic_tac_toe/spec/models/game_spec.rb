require_relative "../../app/models/game"

describe "Game" do
  subject(:game) { Game.new(active_player, idle_player)}
  let(:active_player) { Player.new({human: false}) }
  let(:idle_player) { Player.new({human: false}) }

  describe "#set_markers" do
    it "should set active_player#marker to 'X'" do
      game.set_markers("X")
      expect(game.active_player.marker).to eq("X")
    end

    it "should set idle_player#marker to 'O'" do
      game.set_markers("X")
      expect(game.idle_player.marker).to eq("O")
    end
  end

  describe "#check_result" do
    it "should  set reslut to :draw if there will be no winner" do
      game.board.available_spaces = []
      game.check_result
      expect(game.result).to be(:draw)
    end

    it "should  set reslut to active_player if there is a winner" do
      game.board.winner = true
      game.check_result
      expect(game.result).to be(active_player)
    end
  end#check_result

  describe "#toggle_active_player" do
    it "should swap active and idle player" do
      ap_1 = active_player
      game.toggle_active_player
      expect(ap_1).to equal(game.idle_player)
    end
  end#toggle_active_player

  describe "#turn" do
    context "when no move is provided" do
      it "should get a move from AI" do
        game.set_markers("X")
        expect(game).to receive(:ai_move).and_return(4)
        game.turn
      end
    end

    context "when human move is provided" do
      it "should mark correct space on board" do
        game.set_markers("X")
        game.turn(5)
        expect(game.board.matrix[1][2]).to eq("X")
      end
    end

    it "should mark a space on the baord" do
      game.set_markers("X")
      game.turn
      expect(game.board.available_spaces.length).to be(8)
      expect(game.board.matrix.flatten.compact.empty?).to be(false)
    end

    it "should check for a win" do
      expect(game.board).to receive(:check_for_win)
      expect(game).to receive(:check_result)
      game.turn
    end

    it "should toggle_active_player" do
      expect(game).to receive(:toggle_active_player)
      game.turn
    end
  end#turn

end#Game








