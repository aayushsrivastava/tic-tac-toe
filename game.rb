require "./board"
require "./player"

class Game
  attr_accessor :board, :player_x, :player_o
  private :board, :player_x, :player_o

  public

  def initialize
    self.player_x = Player.new(:x)
    self.player_o = Player.new(:o)
    new_game
  end

  def new_game
    self.board = Board.new
    @turn = :x # X plays first in the game
  end

  def play(location)
    if @turn == :x
      @turn = :o if player_x.play(board, location)
    else
      @turn = :x if player_o.play(board, location)
    end
  end

  def progress
    output = ""
    output += board.draw
    if over?
      output += result
    else
      output += whose_turn?
    end
  end

  def over?
    x_won || o_won || board.full?
  end

  private

  def result
    if x_won
      "X won!"
    elsif o_won
      "O won!"
    elsif board.full?
      "Draw!"
    else
      "Game is still in progress..."
    end
  end

  def whose_turn?
    if @turn == :x
      "X's turn"
    else
      "O's turn"
    end
  end

  def x_won
    check_victory(board.x_location)
  end

  def o_won
    check_victory(board.o_location)
  end

  def check_victory(locations)
    row_victory(locations) \
    || column_victory(locations) \
    || diagonal_victory(locations)
  end

  def row_victory(locations) 
    present(locations,[1,2,3]) \
    || present(locations,[4,5,6]) \
    || present(locations,[7,8,9])
  end

  def column_victory(locations) 
    present(locations,[1,4,7]) \
    || present(locations,[2,5,8]) \
    || present(locations,[3,6,9])
  end

  def diagonal_victory(locations)
    present(locations,[1,5,9]) \
    || present(locations,[3,5,7]) \
  end

  def present(locations, test_locations)
    test_locations.reduce(true) do |present, location|
      present &= locations.include?(location)
    end
  end

end
