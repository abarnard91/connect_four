class Player
  attr_accessor :chip
  def initialize
    @score = 0
    @winner = false
    @chip = "\u263A" #white chip
  end

  def player_move()
    move = 9999
    until move.between?(0,8)
      puts "Enter where you would like to drop your chip?"
      puts "Enter 1-7 only!"
      move = gets.chomp.to_i
    end
    return move
    
  end


end