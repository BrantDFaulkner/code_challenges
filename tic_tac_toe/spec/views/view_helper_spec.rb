require_relative "../../app/views/view_helper"

describe ViewHelper do
  let(:view_helper) { Class.new.class.include(ViewHelper) }

  describe "#sleep_clear_screen" do
    it "should #my_sleep and #clear_screen" do
      expect(view_helper).to receive(:my_sleep)
      expect(view_helper).to receive(:clear_screen)
      view_helper.sleep_clear_screen
    end
  end

  describe "#clear_screen" do
    it "should clear the terminal" do
      expect(view_helper).to receive(:puts).with("\e[H\e[2J")
      view_helper.clear_screen
    end
  end

  describe "#my_sleep" do
    it "should output a sleep effect" do
      expect(view_helper).to receive(:print).at_least(:once)
      expect(view_helper).to receive(:sleep).at_least(:once)
      expect(view_helper).to receive(:puts).at_least(:once)
      view_helper.my_sleep
    end
  end

  describe "#header" do
    let(:title) { "FANCY TITLE" }
    it "should output a header" do
      expect(view_helper).to receive(:puts).with(/#{title}/)
      view_helper.header(title)
    end
  end

  describe "#input_error_y_n" do
    it "should output a 'Y', 'N' error message" do
      expect(view_helper).to receive(:puts).with(/'Y'/).with(/'N'/)
      view_helper.input_error_y_n
    end
  end

  describe "#input_error_x_o" do
    it "should output a 'X', 'O' error message" do
      expect(view_helper).to receive(:puts).with(/'X'/).with(/'O'/)
      view_helper.input_error_x_o
    end
  end

end#ViewHelper