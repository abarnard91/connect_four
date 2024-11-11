class Computer
  attr_accessor :chip
  def initialize
    @score = 0
    @winner = false
    @chip = "\u263B" #black chip
  end

  def computer_move
    move = rand(1..7)
    return move
  end

end