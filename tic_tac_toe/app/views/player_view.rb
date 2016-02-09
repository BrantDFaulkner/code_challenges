require_relative "view_helper"

class PlayerView
  include ViewHelper

  def set_human(params)
    header("SETUP #{params[:player_str]}")
    puts "Is #{params[:player_str]} human? (Y/N): "
    input = gets.chomp.upcase
    if input == "Y"
      params[:human] = true
    elsif input == "N"
      params[:human] = false
    else
      input_error_y_n
      set_human(params)
    end
    params
  end

  def name(params)
    puts "Please choose your player name: "
    input = gets.chomp
    if input.length > 0
      params[:name] = input
    else
      name(params)
    end
    params
  end

  def affirm_markers(active_player, idle_player)
    puts "#{active_player.name} will use marker '#{active_player.marker}'"
    puts "#{idle_player.name} will use marker '#{idle_player.marker}'"
    sleep_clear_screen
  end

  def greet(player)
    if player.human
      puts "Thanks playing Tic Tac Toe #{player.name}. Enjoy the game!"
    else
      puts "#{player.name} has accepted the challenge and is ready to compete!"
    end
    sleep_clear_screen
  end

  def move(player, moves)
    puts "#{player.name} it is your turn. Your marker is '#{player.marker}.' Please make a move:"
    input = gets.chomp.to_i
    if moves.include?(input -1)
      puts "#{player.name} has chosen space #{input}."
      sleep_clear_screen
      move = input - 1
    else
      puts "Sorry, that is not a valid move."
      move(player, moves)
    end
  end

  def ai_move(player)
    puts "#{player.name}'s marker is '#{player.marker}'"
    puts "#{player.name} is thinking"
    sleep_clear_screen
  end

end#PlayerView