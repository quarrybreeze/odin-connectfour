require_relative 'tile'

class Board

  attr_accessor :tiles

  def initialize
    @tiles = []
    self.generate
    # self.display
  end

  def display
    puts "Col:  |1|2|3|4|5|6|7|"
    for i in (5).downto(0)
      puts "Row #{i+1} |" + @tiles[0][i].display + "|" +
      @tiles[1][i].display + "|" +
      @tiles[2][i].display + "|" +
      @tiles[3][i].display + "|" +
      @tiles[4][i].display + "|" +
      @tiles[5][i].display + "|" +
      @tiles[6][i].display + "|" 
    end
  end

  def insert_symbol(symbol,column)
    row = 0

    while @tiles[column-1][row].display != " "
      row += 1
    end

    @tiles[column-1][row].display = symbol
  end

  private 
  
  def generate
    for i in 0..6
      @tiles[i] = self.create_column
    end
  end

  def create_column
    column = []
    6.times do 
      column << Tile.new()
    end
    return column
  end
 
end

test = Board.new
test.display
test.insert_symbol("X",1)
test.display
test.insert_symbol("O",1)
test.display
test.insert_symbol("X",2)
test.display