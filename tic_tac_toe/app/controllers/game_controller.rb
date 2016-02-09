require_relative "../models/game"
require_relative "../views/game_view"

class GameController

  attr_accessor :game
  attr_reader :game_view, :board_view, :player_view

  def initialize
    @game_view = GameView.new
    @board_view = BoardView.new
    @player_view = PlayerView.new
    @game = nil
  end

  def play
    setup_game
    until game.result
      turn
    end
    board_view.display(board)
    game_view.end_of_game(game.result)
  end

  def turn
    board_view.display(board)
    if active_player.human
      move = player_view.move(active_player, board.available_spaces)
      game.turn(move)
    else
      player_view.ai_move(active_player)
      game.turn
    end
  end

  def setup_game
    create_game
    set_markers
    set_active_player
  end

  def create_game
    game_view.welcome
    player_1 = create_player({player_str: "PLAYER ONE"})
    player_2 = create_player({player_str: "PLAYER TWO"})
    self.game = Game.new(player_1, player_2)
  end

  def create_player(params)
    params = player_view.set_human(params)
    params = player_view.name(params) if params[:human]
    player = Player.new(params)
    player_view.greet(player)
    player
  end

  def set_markers
    game.set_markers(game_view.set_markers(active_player.name))
    player_view.affirm_markers(active_player, idle_player)
  end

  def set_active_player
    game_view.header_first_player
    game.toggle_active_player if game_view.set_active_player(active_player, idle_player) == idle_player
  end

private

  def active_player
    game.active_player
  end

  def idle_player
    game.idle_player
  end

  def board
    game.board
  end

end#GameController