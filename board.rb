class Board
  attr_reader :x_location, :o_location
  attr_writer :x_location; private :x_location=
  attr_writer :o_location; private :o_location=

  public

  def initialize
    clear
  end

  def draw
    la = location_arts
    board = 
      " #{la[1]} | #{la[2]} | #{la[3]} \n" +
      "--- --- ---\n" +
      " #{la[4]} | #{la[5]} | #{la[6]} \n" +
      "--- --- ---\n" +
      " #{la[7]} | #{la[8]} | #{la[9]} \n"
  end

  def fill_x(location)
    x_location.push(location) unless include?(location) || !valid?(location)
  end

  def fill_o(location)
    o_location.push(location) unless include?(location) || !valid?(location)
  end

  def full?
    return true if x_location.size + o_location.size == 9
  end

  private

  def clear
    self.x_location = []
    self.o_location = []
  end

  def valid?(location)
    (1..9).include?(location)
  end

  def include?(location)
    x_location.include?(location) || o_location.include?(location)
  end

  def location_arts
    location_arts = [" "] * 10
    x_location.each { |loc| location_arts[loc] = "X" }
    o_location.each { |loc| location_arts[loc] = "O" }
    location_arts
  end

end
