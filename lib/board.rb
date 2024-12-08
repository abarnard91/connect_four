require_relative "win_moves.rb"
class Board
  include Win_moves
  attr_accessor :board, :winner, :player_moves_arr, :computer_moves_arr, :complete_move, :r1, :r2, :r3, :r4, :r5, :r6

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
  
  # def empty_board  
  #   @r6 = "|___|___|___|___|___|___|___|"
  #   @r5 = "|___|___|___|___|___|___|___|"
  #   @r4 = "|___|___|___|___|___|___|___|"
  #   @r3 = "|___|___|___|___|___|___|___|"
  #   @r2 = "|___|___|___|___|___|___|___|"
  #   @r1 = "|___|___|___|___|___|___|___|"
  #   @r0 = "  1   2   3   4   5   6   7  " 
  #   @board = [@r6, @r5, @r4, @r3, @r2, @r1, @r0]
  #   #1:R#[2], 2:R#[6], 3:R#[10], 4:R#[14], 5:R#[18], 6:R#[22], 7:R#[26]
  # end

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
 
#### example for using json to save game  ####
  # def to_json #method for saving player data to json file if quitting
  #   File.write('game_save.json',JSON.dump({
  #     :score => @score,
  #     :letter_guessed => @letter_guessed,
  #     :guess_array=> @guess_array
  #   }))
  # end

  # def self.from_json(player_save) #for loading json data from previous save to instance of HumanPlayer class
  #   save_file = File.read(player_save)
  #   data = JSON.parse(save_file) 
  #   self.new(data['score'],data['letter_guessed'],data['guess_array'])
  # end

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
    self.r0 = data['r0']
    self.r1 = data['r1']
    self.r2 = data['r2']
    self.r3 = data['r3']
    self.r4 = data['r4']
    self.r5 = data['r5']
    self.r6 = data['r6']
  end

  def check_for_win(arr)
   if horizontal_win(arr) == true || vertical_win(arr) == true || diagonal_win(arr)
    return @winner = true 
   end
  end

end