require_relative "view_helper"

class BoardView
  include ViewHelper

  def display(board)
    header("TIC TAC TOE")
    available_spaces(board.available_spaces)
    matrix(board.matrix)
  end

  def available_spaces(spaces)
    spaces = spaces.map{ |space| space += 1 }.join(" ,")
    puts "Available moves: #{spaces}"
  end

  def matrix(matrix)
    display = "====+===+====\n"
    matrix.flatten.each_with_index  do |space, index|
      display += "|" if index % 3 == 0
      space ? display += " #{space} |" : display += " #{index + 1 } |"
      display += "\n====+===+====\n" if index % 3 == 2
    end
    puts display.chop
  end

end#BoardView