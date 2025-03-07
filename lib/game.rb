require_relative '../lib/board'
require_relative '../lib/player'

class Game
  
  def initialize
    @board = Board.new
    @players = []
    @gameover = false
    self.play_game
  end

  def play_game
    self.create_player
    self.create_player
    while @gameover == false
      self.player_turn
      self.switch_turn
    end
  end

  def player_turn
    current_player = @players[0].symbol
    puts "Player #{current_player}, choose a column between 1 and 7 to drop your symbol"
    input_column = gets.chomp.to_i

    if input_column > 7 || input_column < 0
      puts "Error, please choose a valid column"
      self.player_turn
    else
      @board.insert_symbol(current_player,input_column)
      self.gameover?
    end
    self.display
  end

  def gameover?
    if @board.winner?
      puts "Player #{@players[0].symbol} wins"
      @gameover = true
    elsif @board.tie?
      puts "Tied. Game over"
      @gameover = true
    end
  end

  def display
    @board.display
  end

  def create_player
    player = Player.new
    player.set_symbol
    @players << player
  end

  private

  def switch_turn
    @players = @players.rotate
  end



end
