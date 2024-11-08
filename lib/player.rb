class Player
  attr_accessor :chip
  def initialize
    @score = 0
    @winner = false
    @chip = "\u263A" #white chip
  end

end