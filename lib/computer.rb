class Computer
  attr_accessor :chip
  def initialize
    @score = 0
    @winner = false
    @chip = "\u263B" #black chip
  end
end