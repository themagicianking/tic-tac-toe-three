module Board
  def display(data)
    # data should be an array used to print out the board
    puts " #{data[:a]} | #{data[:b]} | #{data[:c]} "
    puts " -   -   -"
    puts " #{data[:d]} | #{data[:e]} | #{data[:f]} "
    puts " -   -   -"
    puts " #{data[:g]} | #{data[:h]} | #{data[:i]}"
  end
end

class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  attr_reader :name, :symbol

  def check_win
    # check all the conditions that the board can have that would mean a win
    # maybe take this from the board module
  end
end

class Game
  include Board

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board_data = { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9}
  end

  def board_data
    return @board_data
  end

  def turn(name, symbol)
    puts "Hello #{name}, where would you like to place your symbol?"
    choice = gets.to_i
    change = 0
    board_data.each do |key, value| 
      if choice == value
        change = key
      end
    end
    board_data[change] = symbol
    self.display(board_data)
  end
end

player_one = Player.new("thane", "x")
player_two = Player.new("turkey", "o")

new_game = Game.new(player_one, player_two)

puts new_game.display(new_game.board_data)
new_game.turn(player_one.name, player_one.symbol)
