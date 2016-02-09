require_relative "app/controllers/game_controller"

def simulate_ai(num)
  draw = 0
  winner = 0
  num.times do
    player_1 = Player.new({human: false})
    player_2 = Player.new({human: false})
    game = Game.new(player_1, player_2)

    game.set_markers("X")

    until game.result
      game.turn
    end

    draw +=1 if game.result == :draw
    winner +=1 if game.result != :draw
    puts "Draws: #{draw}"
    puts "Wins: #{winner}"
  end
end

simulate_ai(1000000)
