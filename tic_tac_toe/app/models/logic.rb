require_relative "matrix"

class Logic
  include Matrix

  attr_accessor :marker
  attr_reader :matrix

  def initialize(matrix, marker)
    @matrix = matrix
    @marker = marker
  end

  def first_move
    available_spaces.length == 9 ? available_spaces : []
  end

  def winning_moves(grid=matrix)
    available_spaces(grid).map do |space|
      winner = false
      lines(test_move(space, grid)).each do |line|
        winner = true if winning_line?(line)
      end
      space if winner
    end.compact
  end

  def block_win
    toggle_marker
    blocks = winning_moves
    toggle_marker
    blocks
  end

  def trap_moves
    available_spaces.map do |space|
      space if trapped?(test_move(space))
    end.compact
  end

  def block_trap
    opp_traps = opponent_traps
    if opp_traps.length == 1
      opp_traps
    else
      two_thirds_with_blocks(matrix).map do |space, blocks|
         space if (opp_traps & blocks).empty?
      end.compact
    end
  end

  def center
    matrix[1][1] ? [] : [4]
  end

  def empty_corner
    [0,2,6,8] & available_spaces
  end

  def empty_side
    [1,3,5,7] & available_spaces
  end

private

  def available_spaces(grid=matrix)
    grid=matrix.flatten.map.with_index do |space, i|
      i unless space
    end.compact
  end

  def test_move(space, grid=matrix)
    grid = grid.map(&:dup)
    grid[space/3][space%3] = marker
    grid
  end

  def trapped?(grid)
    winning_moves(grid).length > 1
  end

  def toggle_marker
    marker == "X" ? self.marker = "O" : self.marker = "X"
  end
#block_trap
  def opponent_traps
    toggle_marker
    opp_trap_moves = trap_moves
    toggle_marker
    opp_trap_moves
  end

  def two_thirds_with_blocks(grid)
    moves = two_thirds_winner_moves(grid)
    move_block_hash = {}
    moves.each do |space|
      move_block_hash[space] = winning_moves(test_move(space, grid))
    end
    move_block_hash
  end

  def two_thirds_winner_moves(grid)
    available_spaces(grid).map do |space|
      two_thirds = false
      lines(test_move(space, grid)).each do |line|
        two_thirds = true if two_thirds_win?(line)
      end
      space if two_thirds
    end.compact
  end

  def two_thirds_win?(line)
    line = line.compact
    line.length == 2 && line.uniq.length == 1
  end

end#Logic