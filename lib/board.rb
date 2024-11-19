class Board
  attr_accessor :board, :r1, :r2, :r3, :r4, :r5, :r6, :player_moves_arr, :computer_moves_arr

  def initialize
    @board = nil
    @player_moves_arr = []
    @computer_moves_arr = []
  
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
        return spot[x]
      end
    end
  end

  def move_array_sort(arr)
    arr.sort!
    pm1 = []
    pm2 = []
    pm3 = []
    pm4 = []
    pm5 = []
    pm6 = []
    pm7 = []

    arr.each do |move_arr|
      case move_arr[0]
      when 1 then pm1 << move_arr[1]
      when 2 then pm2 << move_arr[1]
      when 3 then pm3 << move_arr[1]
      when 4 then pm4 << move_arr[1]
      when 5 then pm5 << move_arr[1]
      when 6 then pm6 << move_arr[1]
      when 7 then pm7 << move_arr[1]       
      end
    end
    arr_of_arr = [pm1, pm2, pm3, pm4, pm5, pm6, pm7]
    #arr_of_arr
  end
  def vertical_win (arr)
    count = 0
    
    arr.each do |x_axis|
      #puts "x_axis is #{x_axis}"
      pyv = 0
      x_axis.each do |y_axis| 
         #previous y value
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
        puts "count is #{count}"
      end

      if count == 4
        return true
      end
    end
  end
  
end