require_relative "win_moves.rb"
class Board
  include Win_moves
  attr_accessor :board, :winner, :player_moves_arr, :computer_moves_arr, :complete_move,:r0, :r1, :r2, :r3, :r4, :r5, :r6

  def initialize
   #@board = nil
    @player_moves_arr = []
    @computer_moves_arr = []
    @winner = false
    @complete_move = false
    @r6 = "|___|___|___|___|___|___|___|"
    @r5 = "|___|___|___|___|___|___|___|"
    @r4 = "|___|___|___|___|___|___|___|"
    @r3 = "|___|___|___|___|___|___|___|"
    @r2 = "|___|___|___|___|___|___|___|"
    @r1 = "|___|___|___|___|___|___|___|"
    @r0 = "  1   2   3   4   5   6   7  " 
    @board = [@r6, @r5, @r4, @r3, @r2, @r1, @r0]
  
  end

  def drop_chip(drop_spot, chip)
    if drop_spot == 8 #only possible by choosing to quick in the player start menu
      @winner = true
      return @complete_move = true
    end
    x = ((drop_spot*4)-2) #converts column number (1-7) to array position
    @board.reverse.each_with_index do |spot, i|
      if spot[x] == "_"
        spot[x] = chip
        if chip == "\u263A"
         @player_moves_arr << [drop_spot, i] #drop_spot =x coordinate, i = y coordinate 
        else 
          @computer_moves_arr << [drop_spot, i]
        end
        #puts "complete_move is true!"
        @complete_move = true
        return @complete_move
        puts "you shouldn\'t see me"
      end
    end
    @complete_move = false
    puts "No space for the chip!!!!"
  end

  def to_json 
    File.write('game_save.json',JSON.dump({
      :board => @board,
      :r0 => @r0,
      :r1 => @r1,
      :r2 => @r2,
      :r3 => @r3,
      :r4 => @r4,
      :r5 => @r5,
      :r6 => @r6,
      :winner => @winner, 
      :player_moves_arr => @player_moves_arr,
      :computer_moves_arr => @computer_moves_arr
    }))
  end
  
  def self.from_json(save)
    save_file = File.read(save)
    data = JSON.parse(save_file)
    self.new()
    @r0 = data['r0']
    @r1 = data['r1']
    @r2 = data['r2']
    @r3 = data['r3']
    @r4 = data['r4']
    @r5 = data['r5']
    @r6 = data['r6']
  end

  def check_for_win(arr)
   if horizontal_win(arr) == true || vertical_win(arr) == true || diagonal_win(arr) == true
    #puts "#{arr} is WINNER" #for debugging
    return @winner = true 
   end
  end

  def play_again(player, computer)
  
    puts "Would you like to play again? \n1. yes \n2. no \n(Enter only 1 or 2)"
    player_response = gets.chomp
  
    until player_response.to_i.between?(1,2)
      puts "Please only enter 1 or 2. Thank you!"
      player_response = gets.chomp
    end
  
    if player_response.to_i == 1 
      return true
    else
      puts "Thanks for playing!"
      puts "Final scores: You: #{player.score} computer: #{computer.score}"
      return false
    end
  
  end
  
end