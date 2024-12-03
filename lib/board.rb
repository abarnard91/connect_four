class Board
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
 
  def vertical_win (arr)
    arr.sort!
    x_1 = [] # x axis
    x_2 = []
    x_3 = []
    x_4 = []
    x_5 = []
    x_6 = []
    x_7 = []

    arr.each do |move_arr|
      case move_arr[0]
      when 1 then x_1 << move_arr[1]
      when 2 then x_2 << move_arr[1]
      when 3 then x_3 << move_arr[1]
      when 4 then x_4 << move_arr[1]
      when 5 then x_5 << move_arr[1]
      when 6 then x_6 << move_arr[1]
      when 7 then x_7 << move_arr[1]       
      end
    end
    arr_of_arr = [x_1, x_2, x_3, x_4, x_5, x_6, x_7]

    count = 0
    
    arr_of_arr.each do |x_axis|
      #puts "x_axis is #{x_axis}"
      pyv = 0 #previous y value
      x_axis.each do |y_axis| 
        #puts "y_axis is #{y_axis} and pyv is #{pyv}"
        if (y_axis - pyv) == 1
          count += 1
        else 
        count = 0
        end
        pyv = y_axis
        if count == 4 
          break
        end
        #puts "count is #{count}"
      end

      if count == 4
        return @winner = true
      end
    end
  end

  def horizontal_win(arr)
    arr.sort!
    #puts "arr is #{arr}"
    y_1 = [] #y_axis
    y_2 = []
    y_3 = []
    y_4 = []
    y_5 = []
    y_6 = []

    arr.each do |move_arr|
      case move_arr[1]
      when 1 then y_1 << move_arr[0]
      when 2 then y_2 << move_arr[0]
      when 3 then y_3 << move_arr[0]
      when 4 then y_4 << move_arr[0]
      when 5 then y_5 << move_arr[0]
      when 6 then y_6 << move_arr[0]     
      end
    end
    arr_of_arr = [y_1, y_2, y_3, y_4, y_5, y_6]
    #puts "arr of arr is #{arr_of_arr}"
    arr_of_arr.each do |y_axis|
      case y_axis
      in [1,2,3,4,*] | [*,2,3,4,5,*] | [*,3,4,5,6]
        return @winner = true
      else
        
      end
    end
    "No winner yet"
  end

  def diagonal_win(arr)
    arr.sort!
    #puts "arr is #{arr}"
    #prev_coor = []
    i = 0
    count = 0
    arr.each do |coor|
      #puts "coor is #{coor}"
      4.times do
        if arr.any?{|xy| xy == [(coor[0]+i),(coor[1]+i)]}
          #puts "yes"

          count += 1 
          i += 1
        else
          #puts "no"
          i = 0
          count = 0
          break
        end
      end
      if count >= 4
        return @winner = true
      else
        4.times do 
          if arr.any?{|xy| xy == [(coor[0]+i),(coor[1]-i)]}
            count += 1 
            i += 1
          else
            i = 0
            count = 0
            break
          end
        end
      end
      if count >= 4
        return @winner = true
      end
    end
  end
  
  def check_for_win(arr)
    horizontal_win(arr)
    vertical_win(arr)
    diagonal_win(arr)
  end

end