require_relative "matrix"

class Board
  include Matrix

  attr_accessor :matrix, :available_spaces, :winner

  def initialize
    @matrix = Array.new(3){Array.new(3) {nil}}
    @available_spaces = Array(0..8)
    @winner = false
  end

  def check_for_win
    lines(matrix).each { |line| self.winner = true if winning_line?(line) }
  end

  def mark_space(space, marker)
    self.matrix[space/3][space%3] = marker
    self.available_spaces.delete(space)
  end

end#Board