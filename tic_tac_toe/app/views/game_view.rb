require_relative "board_view"
require_relative "player_view"

class GameView
  include ViewHelper

  def welcome
    clear_screen
    header("WELCOME TO TIC TAC TOE")
    sleep_clear_screen
  end

  def header_first_player
    header("CHOOSE FIRST PLAYER")
  end

  def set_markers(name)
    header("SET UP MARKERS")
    puts "Please choose a marker for #{name}, (X/O): "
    input = gets.chomp.upcase
    if input == "X" || input == "O"
      input
    else
      input_error_x_o
      set_markers(name)
    end
  end

  def set_active_player(active_player, idle_player)
    puts "Which player will go first?"
    puts "Enter '#{active_player.marker}'' for #{active_player.name}"
    puts "Enter '#{idle_player.marker}'' for #{idle_player.name}"
    input = gets.chomp.upcase
    if input == active_player.marker
      puts "#{active_player.name} will go first."
      sleep_clear_screen
      active_player
    elsif input == idle_player.marker
      puts "#{idle_player.name} will go first."
      sleep_clear_screen
      idle_player
    else
      input_error_x_o
      set_active_player(active_player, idle_player)
    end
  end

  def end_of_game(result)
    if result == :draw
      puts "This contest has ended in a draw."
    else
      puts "Congradulations #{result.name}! You have won this game!"
    end
  end

end#GameView