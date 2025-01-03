require_relative "win_moves.rb"
class Board
  include Win_moves
  attr_accessor :board, :winner, :player_moves_arr, :computer_moves_arr, :complete_move
  attr_reader :r1, :r2, :r3, :r4, :r5, :r6

  def initialize
    @board = nil
    @player_moves_arr = []
    @computer_moves_arr = []
    @winner = false
    @complete_move = false
  
  end
  
  def empty_board  
    @r6 = "|___|___|___|___|___|___|___|"
    @r5 = "|___|___|___|___|___|___|___|"
    @r4 = "|___|___|___|___|___|___|___|"
    @r3 = "|___|___|___|___|___|___|___|"
    @r2 = "|___|___|___|___|___|___|___|"
    @r1 = "|___|___|___|___|___|___|___|"
    @r0 = "  1   2   3   4   5   6   7  " 
    @board = [@r6, @r5, @r4, @r3, @r2, @r1, @r0]
    #1:R#[2], 2:R#[6], 3:R#[10], 4:R#[14], 5:R#[18], 6:R#[22], 7:R#[26]
  end

  def drop_chip(drop_spot, chip)
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
 


  

  
  
  def check_for_win(arr)
   if horizontal_win(arr) == true || vertical_win(arr) == true || diagonal_win(arr)
    return @winner = true 
   end
  end

end