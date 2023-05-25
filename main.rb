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
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Game
  include Board
  attr_reader :board_data, :name_one, :symbol_one,
  :name_two, :symbol_two, :player_one, :player_two

  def initialize
    puts "Hello! Please enter player one's name:"
    @name_one = gets.chomp
    puts "Please enter your symbol:"
    @symbol_one = gets.chomp
    if @symbol_one.to_i > 0 && @symbol_one.to_i < 10
      puts "Error! Your symbol cannot be a number that is on the board!"
      @symbol_one = "x"
      puts "Your symbol is now x."
    end
    if @symbol_one == ""
      puts "Error! You cannot have a blank symbol!"
      @symbol_one == "x"
    end
    puts "Please enter player two's name:"
    @name_two = gets.chomp
    if @name_two == @name_one
      puts "Error! You cannot have the same name!"
      @name_two = player_two
    end
    puts "Please enter your symbol:"
    @symbol_two = gets.chomp
    if @symbol_two.to_i > 0 && @symbol_two.to_i < 10
      puts "Error! Your symbol cannot be a number that is on the board!"
      @symbol_two = "o"
      puts "Your symbol is now o."
    end
    if @symbol_two == ""
      puts "Error! You cannot have a blank symbol!"
      @symbol_two == "o"
    end
    if @symbol_two == @symbol_one
      puts "Error! You cannot have the same symbol!"
      if @symbol_one == "x"
        @symbol_two = "o"
        puts "Your symbol is now o."
      else
        @symbol_two = "x"
        puts "Your symbol is now x."
      end
    end
    @player_one = Player.new(name_one, symbol_one)
    @player_two = Player.new(name_two, symbol_two)
    @board_data = { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9}
  end

  def turn(name, symbol)
    puts "Hello #{name}, where would you like to place your symbol?"
    choice = gets.chomp.to_i
    change = 0
    board_data.each do |key, value| 
      if choice == value
        change = key
      end
    end
    if change == 0
      puts "Invalid input! Your choice will be selected for you."
      board_data.find do |key, value| 
        if value < 10 && value > 0
          change = key
        end
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

def endgame(winner)
  if winner == "none"
    puts "It's a tie! Thanks for playing :)"
  else
    puts "Congrats, #{winner}, you win!"
  end
end

winner = "none"
new_game = Game.new
new_game.display(new_game.board_data)

for i in 1..4
  new_game.turn(new_game.player_one.name, new_game.player_one.symbol)
  if new_game.check_win(new_game.player_one.symbol, new_game.board_data)
    winner = new_game.player_one.name
    break
  else
    new_game.turn(new_game.player_two.name, new_game.player_two.symbol)
    if new_game.check_win(new_game.player_two.symbol, new_game.board_data)
      winner = new_game.player_two.name
      break
    end
  end
end

if winner == "none"
  new_game.turn(new_game.player_one.name, new_game.player_one.symbol)
end

endgame(winner)