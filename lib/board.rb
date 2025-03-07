require_relative 'tile'

class Board

  attr_accessor :tiles

  def initialize
    @tiles = []
    self.generate
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
      if row > 5
        break
      end
    end

    if row > 5
      puts "That column is full, please choose another."
      input = gets.chomp.to_i
      insert_symbol(symbol,input)
    else
      @tiles[column-1][row].display = symbol
    end
  end

  def winner?
    winner = false

    if self.column_search
      winner = true
    elsif self.row_search
      winner = true
    elsif self.diagonal_search
      winner = true
    end

    return winner
  end

  def tie?
    tie = false

    if self.full?
      tie = true
    end

    return tie
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

  def full?
    @tiles.all? { |column| column.all? { |tile| tile.display != " " } }
  end

  def four_connected?(tile1,tile2,tile3,tile4)
    tile1.display == tile2.display &&
    tile2.display == tile3.display &&
    tile3.display == tile4.display
  end

  def column_search
    found = false
    for col in 0..6
      for i in 0..2
        tile1 = @tiles[col][0+i]
        tile2 = @tiles[col][1+i]
        tile3 = @tiles[col][2+i]
        tile4 = @tiles[col][3+i]
        if four_connected?(tile1,tile2,tile3,tile4)
          found = true
        end
      end
    end
    return found
  end

  def row_search
    found = false
    for row in 0..5
      for i in 0..3
        tile1 = @tiles[0+i][row]
        tile2 = @tiles[1+i][row]
        tile3 = @tiles[2+i][row]
        tile4 = @tiles[3+i][row]
        if four_connected?(tile1,tile2,tile3,tile4)
          found = true
        end
      end
    end
    return found
  end

  def diagonal_search
    diagonals = [
      [@tiles[0][0],@tiles[1][1],@tiles[2][2],@tiles[3][3]], #0
      [@tiles[0][1],@tiles[1][2],@tiles[2][3],@tiles[3][4]], #1
      [@tiles[0][2],@tiles[1][3],@tiles[2][4],@tiles[3][5]], #2
      [@tiles[1][0],@tiles[2][1],@tiles[3][2],@tiles[4][3]], #3
      [@tiles[1][1],@tiles[2][2],@tiles[3][3],@tiles[4][4]], #4
      [@tiles[1][2],@tiles[2][3],@tiles[3][4],@tiles[4][5]], #5
      [@tiles[2][0],@tiles[3][1],@tiles[4][2],@tiles[5][3]], #6
      [@tiles[2][1],@tiles[3][2],@tiles[4][3],@tiles[5][4]], #7
      [@tiles[2][2],@tiles[3][3],@tiles[4][4],@tiles[5][5]], #8
      [@tiles[3][0],@tiles[4][1],@tiles[5][2],@tiles[6][3]], #9
      [@tiles[3][1],@tiles[4][2],@tiles[5][3],@tiles[6][4]], #10
      [@tiles[3][2],@tiles[4][3],@tiles[5][4],@tiles[6][5]], #11
      [@tiles[3][0],@tiles[2][1],@tiles[1][2],@tiles[0][3]], #12
      [@tiles[3][1],@tiles[2][2],@tiles[1][3],@tiles[0][4]], #13
      [@tiles[3][2],@tiles[2][3],@tiles[1][4],@tiles[0][5]], #14
      [@tiles[4][0],@tiles[3][1],@tiles[2][2],@tiles[1][3]], #15
      [@tiles[4][1],@tiles[3][2],@tiles[2][3],@tiles[1][4]], #16
      [@tiles[4][2],@tiles[3][3],@tiles[2][4],@tiles[1][5]], #17
      [@tiles[5][0],@tiles[4][1],@tiles[3][2],@tiles[2][3]], #18
      [@tiles[5][1],@tiles[4][2],@tiles[3][3],@tiles[2][4]], #19
      [@tiles[5][2],@tiles[4][3],@tiles[3][4],@tiles[2][5]], #20
      [@tiles[6][0],@tiles[5][1],@tiles[4][2],@tiles[3][3]], #21
      [@tiles[6][1],@tiles[5][2],@tiles[4][3],@tiles[3][4]], #22
      [@tiles[6][2],@tiles[5][3],@tiles[4][4],@tiles[3][5]], #23
    ]

    found = false

    diagonals.each do |diag|
      if four_connected?(diag[0],diag[1],diag[2],diag[3])
        found = true
      end
    end

    return found
  end
 
end

test = Board.new
test.insert_symbol("X",1)
test.insert_symbol("O",1)
test.insert_symbol("X",1)
test.insert_symbol("X",1)
test.insert_symbol("O",1)
test.insert_symbol("X",1)
test.display
test.insert_symbol("X",2)
test.insert_symbol("X",2)
test.insert_symbol("X",2)
test.insert_symbol("O",2)
test.insert_symbol("X",2)
test.insert_symbol("O",2)
test.display
test.insert_symbol("X",3)
test.insert_symbol("X",3)
test.insert_symbol("X",3)
test.insert_symbol("O",3)
test.insert_symbol("X",3)
test.insert_symbol("O",3)
test.display
test.insert_symbol("X",4)
test.insert_symbol("O",4)
test.insert_symbol("X",4)
test.insert_symbol("O",4)
test.insert_symbol("X",4)
test.insert_symbol("O",4)
test.display
test.insert_symbol("X",5)
test.insert_symbol("O",5)
test.insert_symbol("X",5)
test.insert_symbol("O",5)
test.insert_symbol("X",5)
test.insert_symbol("O",5)
test.display
test.insert_symbol("X",6)
test.insert_symbol("O",6)
test.insert_symbol("X",6)
test.insert_symbol("O",6)
test.insert_symbol("X",6)
test.insert_symbol("O",6)
test.display
# puts test.full?
test.insert_symbol("X",7)
test.insert_symbol("O",7)
test.insert_symbol("X",7)
test.insert_symbol("O",7)
test.insert_symbol("X",7)
test.insert_symbol("O",7)
test.display
# puts test.full?
# p test.tiles[0][0].display
# p test.tiles[1][0].display
# p test.tiles[2][0].display
# p test.tiles[3][0].display
# p test.four_connected?(test.tiles[0][0],test.tiles[1][0],test.tiles[2][0],test.tiles[3][0])
# p test.column_search
# p test.row_search
# p test.diagonal_search