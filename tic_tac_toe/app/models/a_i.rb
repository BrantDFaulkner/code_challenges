require_relative "logic"

class AI

  attr_accessor :matrix, :marker
  attr_reader :logic

  def initialize(matrix, marker)
    @matrix = matrix
    @marker = marker
    @logic = Logic.new(matrix, marker)
  end

  def move
  ai_move = logic.first_move.sample
  ai_move ||= logic.winning_moves.sample
  ai_move ||= logic.block_win.sample
  ai_move ||= logic.trap_moves.sample
  ai_move ||= logic.block_trap.sample
  ai_move ||= logic.center.sample
  ai_move ||= logic.empty_corner.sample
  ai_move ||= logic.empty_side.sample
  ai_move
  end#ai_move

end#ArtificialIntelligence


