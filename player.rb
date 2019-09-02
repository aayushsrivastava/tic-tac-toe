class Player
  def initialize(symbol)
    @symbol = symbol
  end

  def play(board, location)
    if @symbol == :x
      board.fill_x(location)
    else
      board.fill_o(location)
    end
  end
end
