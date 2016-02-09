require_relative "board"
require_relative "a_i"
require_relative "player"

class Game
  attr_accessor :result, :active_player, :idle_player, :markers
  attr_reader :board

  def initialize(active_player, idle_player)
    @board = Board.new
    @active_player = active_player
    @idle_player = idle_player
    @markers = ["X","O"]
    @result = nil
  end

  def set_markers(active_marker)
    active_player.marker = markers.delete(active_marker)
    idle_player.marker = markers.delete_at(0)
  end

  def turn(move=nil)
    move ||= ai_move
    board.mark_space(move, active_player.marker)
    board.check_for_win
    check_result
    toggle_active_player
  end

  def check_result
    self.result = active_player if board.winner
    self.result = :draw if board.available_spaces.empty?
  end

  def toggle_active_player
    self.active_player, self.idle_player = idle_player, active_player
  end

private

  def ai_move
    AI.new(board.matrix, active_player.marker).move
  end

end#game