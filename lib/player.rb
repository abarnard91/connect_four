class Player
  attr_accessor :chip, :saq, :score, :reset, :quit
    
  def initialize (score = 0)
    @score = score
    @winner = false
    @chip = "\u263A" #white chip
    @reset = false
    @saq = false #save and quit
    @quit = false #quit without saving of course
  end

  def player_move()
    move = 9999
    until move == "start" || move.between?(1,7) 
      puts "Enter where you would like to drop your chip?"
      puts "Enter 1-7 only!"
      move = gets.chomp
      #puts "move is #{move} "
      unless move == "start"
        move = move.to_i
        puts "move is an integer #{move.is_a?(Integer)} #{move}"
        #return move
      end
    end
    unless move.is_a?(Integer)
      move = start_menu()
      move = 8
    else
      return move
    end
  end

  def start_menu
    puts "Welcome to the start menu"
    puts "-Enter 1 to resume game\n-Enter 2 to save and quit\n-Enter 3 start a new game\n-Enter 4 to quit"
    response = gets.chomp.to_i
    #puts "you picked #{response} well too bad we\'re quitting sucka!"
    case response
    when 1 then player_move()
    when 2 then return @saq = true
    when 3 then return @reset = true
    when 4 then return @quit = true
    end
  end

  def to_json
    File.write("player_save.json", JSON.dump({:score => @score}))
  end

  def self.from_json(save)
    save_file = File.read(save)
    data = JSON.parse(save_file)
    self.new(data['score'])
  end

end