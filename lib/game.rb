require_relative '../lib/board'
require_relative '../lib/player'

class Game
  
  def initialize
    @board = Board.new
    @players = []
    @gameover = false


  end

  def display
    @board.display
  end

  def create_player
    player = Player.new
    player.set_symbol
    @players << player
  end

  def switch_turn
    @players.rotate
  end


end

test = Game.new
test.display
test.create_player