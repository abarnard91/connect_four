class Player
  attr_accessor :chip
  def initialize
    @score = 0
    @winner = false
    @chip = "\u263A" #white chip
  end

  def player_move()
    move = 9999
    until move == "start" || move.between?(1,7) 
      puts "Enter where you would like to drop your chip?"
      puts "Enter 1-7 only!"
      move = gets.chomp
      puts "move is #{move} "
      if move != "start"
        move = move.to_i
        puts "move is an integer #{move.is_a?(Integer)} #{move}"
      end
    end
    unless move.is_a?(Integer)
      start_menu()
    end
  end
  def start_menu
    puts "puts welcome to the start menu"
    puts "Enter 1 to resume game\nEnter 2 to save and quit\nEnter 3 start a new game\nEnter 4 to quit"
    response = gets.chomp
    puts "you picked #{response} well too bad we\'re quitting sucka!"
  end

end