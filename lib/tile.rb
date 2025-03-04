class Tile 

  attr_accessor :display
  
  def initialize
    @display = " "
  end

  def display_symbol(symbol)
    @display = symbol
  end

end