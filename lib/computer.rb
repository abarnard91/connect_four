class Computer
  attr_accessor :chip, :score
  def initialize(score = 0)
    @score = score
    @winner = false
    @chip = "\u263B" #black chip
  end

  def computer_move
    move = rand(1..7)
    return move
  end

  def converter(x_cor) #turns X_cor from the drop spot number (1-7) to the array index corresponding to that spot in R1-R6
    if x_cor.nil?
      x_cor = 0
    end
    return (x_cor * 4) - 2
  end

  def v_player_block(player_arr, board)
    player_arr.sort!
    x_1 = [] # x axis
    x_2 = []
    x_3 = []
    x_4 = []
    x_5 = []
    x_6 = []
    x_7 = []

    player_arr.each do |move|
      case move[0]
      when 1 then x_1 << move[1]
      when 2 then x_2 << move[1]
      when 3 then x_3 << move[1]
      when 4 then x_4 << move[1]
      when 5 then x_5 << move[1]
      when 6 then x_6 << move[1]
      when 7 then x_7 << move[1]   
      end
    end

    arr_of_x = [x_1, x_2, x_3, x_4, x_5, x_6, x_7] #sorts player moves by x-axis (x_1 corresponds to column 1 and so on)

    arr_of_x.each_with_index do |v_chain, x| #vertical chain
      case v_chain
      in [1,2,3] 
        if board[-5][converter(x+1)] == "_"
          return (x + 1)#the drop spot to block 4 in a row vertically
        end
      in [*,2,3,4] 
        if board[-6][converter(x+1)] == "_"
          return (x + 1)#the drop spot to block 4 in a row vertically
        end
      in [*,3,4,5] 
        if board[-7][converter(x+1)] == "_"
          return (x + 1)#the drop spot to block 4 in a row vertically
        end
      else

      end
    end
    return "no match"
  end

  def h_player_block(player_arr, board)

    player_arr.sort!

    y_1 = [] #y_axis
    y_2 = []
    y_3 = []
    y_4 = []
    y_5 = []
    y_6 = []

    player_arr.each do |move|
      case move[1]
      when 1 then y_1 << move[0]
      when 2 then y_2 << move[0]
      when 3 then y_3 << move[0]
      when 4 then y_4 << move[0]
      when 5 then y_5 << move[0]
      when 6 then y_6 << move[0] 
      end
    end

    arr_of_y = [y_1, y_2, y_3, y_4, y_5, y_6] #player moves sorted by y axis with y_1 corresponding to the 1st row of the game board and so on 
  
    arr_of_y.each_with_index do |h_chain, y| #horizontal chain
      case h_chain
      in [1,2,3,*] 
        if board[-(y+2)][(converter(4))] == "_" && board[-(y+1)][(converter(4))] != "_" #checks that if on row 1, if column 4 is open, or on subsequent rows, if the row below is filled and column 4 is open on the same row of 3
          return 4
        end
      in [*,2,3,4,*] 
        if board[-(y+2)][(converter(1))] == "_" && board[-(y+1)][(converter(1))] != "_"
          return 1 
        elsif board[-(y+2)][(converter(5))] == "_" && board[-(y+1)][(converter(5))] != "_"
          return 5
        end

      in [*,3,4,5,*]
        if board[-(y+2)][(converter(2))] == "_" && board[-(y+1)][(converter(2))] != "_"
          return 2
        elsif board[-(y+2)][(converter(6))] == "_" && board[-(y+1)][(converter(6))] != "_"
          return 6
        end

      in [*,4,5,6,*] 
        if board[-(y+2)][(converter(3))] == "_" && board[-(y+1)][(converter(3))] != "_"
          return 3
        elsif board[-(y+2)][(converter(7))] == "_" && board[-(y+1)][(converter(7))] != "_"
          return 7
        end

      in [*,5,6,7]
        if board[-(y+2)][(converter(4))] == "_" && board[-(y+1)][(converter(4))] != "_"
          return 4
        end

      else 
        
      end
    end
    return "no match"
  end

  def d_player_block(player_arr, board) #the most complicated ched
    player_arr.sort!
    i = 0
    count = 0
    last_coor = nil
    player_arr.each do |coor|
      3.times do #3 times check if at a slope of 1, there are 3 player chips in a row
        if player_arr.any?{|xy| xy == [(coor[0]+i),(coor[1]+i)]}
          last_coor = [(coor[0]+i),(coor[1]+i)]
          count += 1 
          i += 1
        else
          i = 0
          count = 0
          last_coor = nil
          break
        end
      end
      if count >= 3 #if there is an positive slope diagonal 3 in a row:

        if board[-(last_coor[1] + 1)][(converter(last_coor[0] + 1))] != "_" && last_coor[0] != 7 #checks that the next spot in the series (ie last coor is 3,4 checks spot 4,5) is open and that the spot below (from the example 4,4) is blocked and that if the last coor is 7 its not trying for a spot 8,x which doesnt exist

          if board[-(last_coor[1] + 2)][(converter(last_coor[0] + 1))] == "_" #if the next corresponding upward spot is available return that x value
            return (last_coor[0] + 1) 
          end
        end

        if board[-(last_coor[1] - 3)][(converter(last_coor[0] - 3))] != "_" && last_coor[0] != 1 #if there is a positive slope but the last spot is not available (ie 3 in a row is [2,3],[3,4],[4,5] but [5,6] is not available) to check for the preceding spot (ie [1,2])
          
          unless board[-(last_coor[1] - 3)][(converter(last_coor[0] - 3))].to_i.between?(1,7)  && board[-(last_coor[1] - 2)][(converter(last_coor[0] - 3))] != "_" #this is to account for checking the 1-7 marking row and to check that the desired spot for a 4 in a row is open and also not assuming that if the the 3 in a row starts at row 1, the 4th spot would be in row 0 (the number row)
            return (last_coor[0] - 3)
          end
        end
      end
      3.times do #if an ascending 3 in a row is not found the same process is done to check for a 3 in a row with a descending 1 slope (ie [3,3], [4,2], [5,1])
        if player_arr.any?{|xy| xy == [(coor[0]+i),(coor[1]-i)]}
          last_coor = [(coor[0]+i),(coor[1]-i)]
          count += 1 
          i += 1
        else
          i = 0
          count = 0
          last_coor = nil
          break
        end
      end
     
      if count >= 3
       #this checks if the last spot is open for a descending order with the same rules as checking the for a 4th spot open at the beginning of an ascending 3 in a row
        if board[-(last_coor[1] - 1)][(converter(last_coor[0] + 1))] != "_" && last_coor[0] != 7
         
          unless board[-(last_coor[1] - 1)][(converter(last_coor[0] + 1))].to_i.between?(1,7) && board[-(last_coor[1])][(converter(last_coor[0] + 1))] != "_"
            return (last_coor[0] + 1)
          end
        end

        if board[-(last_coor[1] + 3)][(converter(last_coor[0] - 3))] != "_" && last_coor[0] != 1 #this checks for an open spot at the beginning of a descending 3 in a row (like that of the last spot of an ascending slope 3 in a row)
          if board[-(last_coor[1] + 4)][(converter(last_coor[0] - 3))] == "_"
            return (last_coor[0] - 3)
          end
        end
      end
    end
    return "no match" #if no such matches are present a string is returned
  end

  def complex_computer_move(board, comp_move_arr=[], player_arr = [])
    move_options = [1,2,3,4,5,6,7]
    #move_options = [2,5,5] #for debugging
    comp_move_arr.each do |coor|
      x = coor[0]
      y = coor[1]
      
      if y < 7
        if y > 1
          if board[-y][converter((x + 1))] == "_" && board[-(y - 1)][converter((x + 1))] != "_"
            if x < 7
              7.times{move_options << (x + 1)} #promotes adding a chip diagonally below to the right if there is a chip underneath or its on the 1st row
            end
          end

          if board[-y][converter((x - 1))] == "_" && board[-(y - 1)][converter((x - 1))] != "_"
            if x > 1
              7.times{move_options << (x - 1)} #promotes adding a chip diagonally below to the left if there is a chip underneath or its on the first row
            end        
          end
        end
        if x < 7
          if board[-(y + 1)][converter((x + 1))] == "_"
            10.times{move_options << (x + 1)} #promotes adding a chip horizontally to the right

          elsif board[-(y + 2)][converter((x + 1))] == "_"
            7.times{move_options << (x + 1)} #promotes adding a chip diagonally up to the right
          end
        end

        if x > 1
          if board[-(y + 1)][converter((x - 1))] == "_"
            10.times{move_options << (x - 1)} #promotes adding a chip horizontally to the left

          elsif board[-(y + 2)][converter((x - 1))] == "_" #promotes addign a chip diagonally up to the left 
            7.times{move_options << (x - 1)}
          end
        end
        unless y > 5
          if board[-(y + 2)][converter(x)] == "_" 
            10.times{move_options << (x)} #promotes adding a chip directly above 
          end
        end
      end

    end
    #if a player has 3 in a row vertically, horizontally, or diagonally, this ensures the next computer move will attempt to block that by making it the only move option for the computer
    if v_player_block(player_arr, board).is_a?(Integer)
      move_options = []
      move_options << v_player_block(player_arr, board)
    end
    if h_player_block(player_arr, board).is_a?(Integer)
      move_options = []
      move_options << h_player_block(player_arr, board)
    end
    if d_player_block(player_arr, board).is_a?(Integer)
      move_options = []
      move_options << d_player_block(player_arr, board)
    end

    #if the computer has a 3 in a row  vertically, horizontally, or diagonally, this ensures the next computer move will a winning move if not blocked by the player 
    if v_player_block(comp_move_arr, board).is_a?(Integer)
      move_options = []
      move_options << v_player_block(comp_move_arr, board)
    end
    if h_player_block(comp_move_arr, board).is_a?(Integer)
      move_options = []
      move_options << h_player_block(comp_move_arr, board)
    end
    if d_player_block(comp_move_arr, board).is_a?(Integer)
      move_options = []
      move_options << d_player_block(comp_move_arr, board)
    end
    #puts "#{move_options} #{move_options.length}"
    return move_options.sample
  end

  def to_json
    File.write("computer_save.json", JSON.dump({:score => @score}))
  end

  def self.from_json(save)
    save_file = File.read(save)
    data = JSON.parse(save_file)
    self.new(data['score'])
  end

end