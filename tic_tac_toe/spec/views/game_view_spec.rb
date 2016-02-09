require_relative "../../app/views/board_view"

describe GameView do
  subject(:game_view) { GameView.new }
  let(:active_player) { double(human: false, marker: "X", name: "John") }
  let(:idle_player) { double(human: false, marker: "O", name: "Jane") }

  before { allow(game_view).to receive(:clear_screen) }
  before { allow(game_view).to receive(:sleep_clear_screen) }

  describe "#welcome" do
    it "should #clear_screen, display #header, and #sleep_clear_screen" do
      expect(game_view).to receive(:clear_screen)
      expect(game_view).to receive(:header)
      expect(game_view).to receive(:sleep_clear_screen)
      game_view.welcome
    end
  end#welcome

  describe "#header_first_player" do
    it "should display #header" do
      expect(game_view).to receive(:header)
      game_view.header_first_player
    end
  end#welcome

  describe "#set_markers" do
    before { expect(game_view).to receive(:header).at_least(:once) }
    before { expect(game_view).to receive(:puts).at_least(:once) }

    context "when input is valid" do
      it "should return valid user marker" do
        expect(game_view).to receive(:gets).and_return("X")
        expect(game_view.set_markers(active_player.name)).to eq("X")
      end
    end#context

    context "when input is invalid" do
      it "should display error, prompt new input, and return valid user marker" do
        expect(game_view).to receive(:gets).and_return("invalid", "o")
        expect(game_view).to receive(:input_error_x_o)
        expect(game_view.set_markers(idle_player.name)).to eq("O")
      end
    end#context
  end#set_markers

  describe "#set_active_player" do
    before { expect(game_view).to receive(:puts).at_least(:once) }
    context "when input is valid" do
      it "should set active player" do
        expect(game_view).to receive(:gets).and_return("X")
        expect(game_view.set_active_player(active_player, idle_player)).to be(active_player)
      end
    end#context

    context "when input is invalid" do
      it "should display error, prompt new input, and set active player" do
        expect(game_view).to receive(:gets).and_return("invalid", "O")
        expect(game_view).to receive(:input_error_x_o)
        expect(game_view.set_active_player(active_player, idle_player)).to be(idle_player)
      end
    end#context
  end#set_active_player

  describe "#end_of_game" do
    it "should output draw message if result is a draw" do
      expect(game_view).to receive(:puts).with(/draw/)
      game_view.end_of_game(:draw)
    end

    it "should output winner message if result is a player" do
      expect(game_view).to receive(:puts).with(/#{active_player.name}/)
      game_view.end_of_game(active_player)
    end
  end#end_of_game

end#GameView






