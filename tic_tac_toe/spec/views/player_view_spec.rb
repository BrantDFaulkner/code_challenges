require_relative "../../app/views/player_view"

describe PlayerView do
  subject(:player_view) { PlayerView.new }
  let(:player_params) { {player_str: "player_str"} }
  let(:active_player) { double(human: false, marker: "X", name: "John") }
  let(:idle_player) { double(human: false, marker: "O", name: "Jane") }

  before { allow(player_view).to receive(:sleep_clear_screen) }

  describe "#set_human" do
    before { expect(player_view).to receive(:header).at_least(:once) }
    before { expect(player_view).to receive(:puts).at_least(:once) }

    context "when input is valid" do
      it "should set params[:human] boolean" do
        expect(player_view).to receive(:gets).and_return("Y")
        expect(player_view.set_human(player_params)[:human]).to be(true)
      end
    end

    context "when input is invalid" do
      it "should set params[:human] boolean" do
        expect(player_view).to receive(:gets).and_return("invalid", "n")
        expect(player_view).to receive(:input_error_y_n)
        expect(player_view.set_human(player_params)[:human]).to be(false)
      end
    end
  end#set_human

  describe "#name" do
    context "when player enters name" do
      it "should set params[:name] to name" do
        expect(player_view).to receive(:puts)
        expect(player_view).to receive(:gets).and_return(active_player.name)
        expect(player_view.name(player_params)[:name]).to eq(active_player.name)
      end
    end

    context "when player doesn't enter name" do
      it "should prompt player again and set params[:name]" do
        expect(player_view).to receive(:puts).at_least(:once)
        expect(player_view).to receive(:gets).and_return("", idle_player.name)
        expect(player_view.name(player_params)[:name]).to eq(idle_player.name)
      end
    end
  end#name

  describe "#affirm_markers" do
    it "shoud affirm each player's marker" do
      expect(player_view).to receive(:puts).with(/#{active_player.name}/)
      expect(player_view).to receive(:puts).with(/#{idle_player.name}/)
      player_view.affirm_markers(active_player, idle_player)
    end
  end#affirm_markers

  describe "#greet" do
    context "when player is not human" do
      it "should greet player by name" do
        expect(player_view).to receive(:puts).with(/John/)
        player_view.greet(active_player)
      end
    end

    context "when player is human" do
      let(:idle_player) { double(human: true, name: "Jane") }
      it "should greet player by name" do
        expect(player_view).to receive(:puts).with(/Jane/)
        player_view.greet(idle_player)
      end
    end
  end#greet

  describe "#move" do
    let(:moves) { [0,1,2,3,4,5]}
    context "when a valid move is selected" do
      it "should affirm and return player move" do
        expect(player_view).to receive(:puts).with(/John/).with(/'X./)
        expect(player_view).to receive(:puts).with(/John/).with(/2/)
        expect(player_view).to receive(:gets).and_return("2")
        expect(player_view.move(active_player, moves)).to be(1)
      end
    end#context

    context "when an invalid move is selected" do
      it "should prompt player again and return player move" do
        expect(player_view).to receive(:puts).at_least(:once)
        expect(player_view).to receive(:gets).and_return("invalid", "3")
        expect(player_view.move(active_player, moves)).to be(2)
      end
    end#context
  end#move

  describe "#ai_move" do
    it "should output 'thinking' message" do
      expect(player_view).to receive(:puts).with(/John/).with(/'X'/)
      expect(player_view).to receive(:puts).with(/John/).with(/thinking/)
      player_view.ai_move(active_player)
    end
  end#ai_move

end#PlayerView