require_relative "../../app/models/player"

describe Player do
  subject(:player) { Player.new(human: false) }

  context "when player is not human" do
    it "should have property human equal false" do
      expect(player.human).to be(false)
    end

    it "should be assigned a name" do
      expect(player.name).to be_a(String)
    end
  end

  context "when player is human" do
    let(:player) { Player.new(human: true, name: name) }
    let(:name) { "John" }
    it "should have property human equal true" do
      expect(player.human).to be(true)
    end

    it "should be get name from param" do
      expect(player.name).to eq(name)
    end
  end

end#Player