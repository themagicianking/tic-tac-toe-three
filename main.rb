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
  attr_reader :board_data

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board_data = { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9}
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

  def check_win(symbol, board)
    if board[:a] == symbol && board[:b] == symbol && board[:c] == symbol
      return true
    elsif board[:a] == symbol && board[:e] == symbol && board[:i] == symbol
      return true
    elsif board[:a] == symbol && board[:d] == symbol && board[:g] == symbol
      return true
    elsif board[:b] == symbol && board[:e] == symbol && board[:h] == symbol
      return true
    elsif board[:c] == symbol && board[:f] == symbol && board[:i] == symbol
      return true
    elsif board[:c] == symbol && board[:e] == symbol && board[:g] == symbol
      return true
    elsif board[:d] == symbol && board[:e] == symbol && board[:f] == symbol
      return true
    elsif board[:g] == symbol && board[:h] == symbol && board[:i] == symbol
      return true
    else
      return false
    end
  end
end

player_one = Player.new("thane", "x")
player_two = Player.new("turkey", "o")
new_game = Game.new(player_one, player_two)
# puts new_game.display(new_game.board_data)
# new_game.turn(player_one.name, player_one.symbol)
puts new_game.check_win("x", { a: "9", b: "x", c: "x", d: 4, e: 5, f: 6, g: 7, h: 8, i: 9})
