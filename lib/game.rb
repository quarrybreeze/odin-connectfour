require_relative '../lib/board'
require_relative '../lib/player'

class Game
  
  def initialize
    @board = Board.new

  end

  def display
    @board.display
  end

  def create_player
    
  end


end

test = Game.new
test.display
