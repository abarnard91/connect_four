class Player
  attr_accessor :chip
  def initialize
    @score = 0
    @winner = false
    @chip = "\u263A" #white chip
  end

  def player_move()
    move = nil
    until move == 1..7 do
      puts "enter where you would like to drop your chip"
      puts "enter 1-7 only"
      move = gets.chomp 
    end
    Board.drop_chip(move, @chip)
    
  end


end