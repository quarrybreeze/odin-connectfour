class Player

  attr_accessor :symbol
  
  def initialize
    @symbol = nil
  end

  def set_symbol
    loop do
      puts "What symbol would you like to use? Type it below:"
      input = gets.chomp

      if input.length != 1
        puts "Symbols must be 1 character. Please try again."
      else
        @symbol = input
        break
      end
    end
  end


  
end

