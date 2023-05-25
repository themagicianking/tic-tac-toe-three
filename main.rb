module Board
  def display(data)
    # data should be an array used to print out the board
    puts " 1 | 2 | 3 "
    puts " -   -   -"
    puts " 4 | 5 | 6 "
    puts " -   -   -"
    puts " 7 | 8 | 9"
  end
end

class Player
  include Board

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def turn
    puts # prints the board out, mixin from a module?
  end

  def check_win
    # check all the conditions that the board can have that would mean a win
    # maybe take this from the board module
  end
end

player_one = Player.new("thane", "x")

puts player_one
player_one.display("meep")