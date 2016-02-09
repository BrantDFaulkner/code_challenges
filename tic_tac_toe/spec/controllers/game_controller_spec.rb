require_relative "../../app/controllers/game_controller"

describe GameController  do
  subject(:game_controller) { GameController.new }
  let(:player_params) { {player_str: "player_str", human: false} }

  before do allow(game_controller.player_view).to receive_messages(
    affirm_markers: nil,
    greet: nil,
    name: player_params,
    set_human: player_params)
  end

  before do allow(game_controller.game_view).to receive_messages(
    header_first_player: nil,
    set_markers: "X",
    welcome: nil)
  end

  describe "#create_player" do
    context "when the player is not human" do
      it "should create a computer player" do
        player = game_controller.create_player(player_params)
        expect(player).to be_a(Player)
        expect(player.human).to be(false)
      end
    end#context

    context "when the player is human" do
      let(:player_params) { {player_str: "player_str", human: true} }
      it "should create a human player" do
        player = game_controller.create_player(player_params)
        expect(player).to be_a(Player)
        expect(player.human).to be(true)
      end
    end#context
  end#create_player

  describe "#create_game" do
    it "should create a Game" do
      expect(game_controller.game).to be(nil)
      game_controller.create_game
      expect(game_controller.game).to be_a(Game)
    end
  end#create_game

  context "when a game has been created" do
    before { game_controller.create_game }

    describe "#set_markers" do
      context "when active_player chooses 'X'" do
        it "should assign active_player marker 'X'" do
          game_controller.set_markers
          expect(game_controller.game.markers.empty?).to be(true)
          expect(game_controller.game.active_player.marker).to eq("X")
        end
      end#context

      context "when active_player chooses 'O'" do
        before { allow(game_controller.game_view).to receive_messages(set_markers: "O") }
        it "should assign active_player marker 'O'" do
          game_controller.set_markers
          expect(game_controller.game.markers.empty?).to be(true)
          expect(game_controller.game.active_player.marker).to eq("O")
        end
      end#context
    end#set_markers

    describe "#set_active_player" do
      context "when active_player is chosen" do
        before { allow(game_controller.game_view).to receive(:set_active_player).and_return(game_controller.game.active_player) }
        it "should not toggle active_player" do
          ap = game_controller.game.active_player
          game_controller.set_active_player
          expect(game_controller.game.active_player).to be(ap)
        end
      end#context

      context "when idle_player is chosen" do
        before { allow(game_controller.game_view).to receive(:set_active_player).and_return(game_controller.game.idle_player) }
        it "should toggle active_player" do
          ip = game_controller.game.idle_player
          game_controller.set_active_player
          expect(game_controller.game.active_player).to be(ip)
        end
      end#context
    end#set_active_player

    describe "#setup_game" do
      it "should #create_game, #set_markers, and #set_active_player" do
        expect(game_controller).to receive(:create_game)
        expect(game_controller).to receive(:set_markers)
        expect(game_controller).to receive(:set_active_player)
        game_controller.setup_game
      end
    end#setup_game

    describe "#turn" do
      before { expect(game_controller.board_view).to receive(:display) }
      before { expect(game_controller.game).to receive(:turn) }

      context "when active_player is not human" do
        it "should declare #ai_move and take a Game#turn" do
          expect(game_controller.player_view).to receive(:ai_move)
          game_controller.turn
        end
      end#context

      context "when active_player is human" do
        let(:player_params) { {player_str: "player_str", human: true} }
        it "should get human move and take a Game#turn" do
          expect(game_controller.player_view).to receive(:move)
          game_controller.turn
        end
      end#context
    end#turn

    describe "#play" do
      it "should play an entire game" do
        expect(game_controller).to receive(:setup_game)
        expect(game_controller.board_view).to receive(:display)
        expect(game_controller).to receive(:turn) do
          game_controller.game.result = :draw
        end
        expect(game_controller.game_view).to receive(:end_of_game)
        game_controller.play
      end
    end
  end#context
end#GameController