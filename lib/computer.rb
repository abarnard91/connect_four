class Computer
  attr_accessor :chip, :score
  def initialize(score = 0)
    @score = score
    @winner = false
    @chip = "\u263B" #black chip
    @converter = -> (x_cor){(x_cor*4)-2} #lamba to convert x coordinate from 1-7 to array index (ie 2 = rx[6] (where x is 1-6 in from the board array))
  end

  def computer_move
    move = rand(1..7)
    return move
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

    arr_of_x = [x_1, x_2, x_3, x_4, x_5, x_6, x_7]

    arr_of_x.each_with_index do |v_chain, x| #vertical chain
      case v_chain
      in [1,2,3] 
        if board[-5][@converter.call(x+1)] == "_"
          return (x + 1)#the drop spot to block 4 in a row vertically
        end
      in [*,2,3,4] 
        if board[-6][@converter.call(x+1)] == "_"
          return (x + 1)#the drop spot to block 4 in a row vertically
        end
      in [*,3,4,5] 
        if board[-7][@converter.call(x+1)] == "_"
          return (x + 1)#the drop spot to block 4 in a row vertically
        end
      else

      end
    end
    return "no match"
  end

  def h_player_block(player_arr, board)

    #z = -> (x_cor){(x_cor*4)-2} 
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

    arr_of_y = [y_1, y_2, y_3, y_4, y_5, y_6]
  
    arr_of_y.each_with_index do |h_chain, y| #horizontal chain
      case h_chain
      in [1,2,3,*] 
        if board[-(y+2)][(@converter.call(4))] == "_" && board[-(y+1)][(@converter.call(4))] != "_"
          return 4
        end
      in [*,2,3,4,*] 
        if board[-(y+2)][(@converter.call(1))] == "_" && board[-(y+1)][(@converter.call(1))] != "_"
          return 1 
        elsif board[-(y+2)][(@converter.call(5))] == "_" && board[-(y+1)][(@converter.call(5))] != "_"
          return 5
        end

      in [*,3,4,5,*]
        if board[-(y+2)][(@converter.call(2))] == "_" && board[-(y+1)][(@converter.call(2))] != "_"
          return 2
        elsif board[-(y+2)][(@converter.call(6))] == "_" && board[-(y+1)][(@converter.call(6))] != "_"
          return 6
        end

      in [*,4,5,6,*] 
        if board[-(y+2)][(@converter.call(3))] == "_" && board[-(y+1)][(@converter.call(3))] != "_"
          return 3
        elsif board[-(y+2)][(@converter.call(7))] == "_" && board[-(y+1)][(@converter.call(7))] != "_"
          return 7
        end

      in [*,5,6,7]
        if board[-(y+2)][(@converter.call(4))] == "_" && board[-(y+1)][(@converter.call(4))] != "_"
          return 4
        end

      else 
        
      end
    end
    return "no match"
  end

  def d_player_block(player_arr, board)
    player_arr.sort!
    i = 0
    count = 0
    last_coor = nil
    player_arr.each do |coor|
      3.times do
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
      if count >= 3
      
        if board[-(last_coor[1] + 1)][(@converter.call(last_coor[0] + 1))] != "_"
          puts "up end #{last_coor} #{board[-(last_coor[1] + 1)][(@converter.call(last_coor[0] + 1))]}"
          return (last_coor[0] + 1)

        elsif board[-(last_coor[1] - 3)][(@converter.call(last_coor[0] - 3))] != "_" 
          
          unless board[-(last_coor[1] - 3)][(@converter.call(last_coor[0] - 3))].to_i.between?(1,7) && board[-(last_coor[1] - 2)][(@converter.call(last_coor[0] - 3))] != "_"
           
            return (last_coor[0] - 3)
          end
        end
      else
        3.times do 
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
      end
      if count >= 3
        puts "going down last_coor is #{last_coor}"
        if board[-(last_coor[1] - 1)][(@converter.call(last_coor[0] + 1))] != "_" 
         
          unless board[-(last_coor[1] - 1)][(@converter.call(last_coor[0] + 1))].to_i.between?(1,7) && board[-(last_coor[1])][(@converter.call(last_coor[0] + 1))] != "_"
            return (last_coor[0] + 1)
          end

        elsif board[-(last_coor[1] + 3)][(@converter.call(last_coor[0] - 3))] != "_"
          return (last_coor[0] - 3)
        end
      end
    end
    return "no match"
  end

  def complex_computer_move(board, comp_move_arr=[], player_arr = [])
    move_options = [1,2,3,4,5,6,7]
    #move_options = [2,5,5] #for debugging
    comp_move_arr.each do |coor|
      x = coor[0]
      y = coor[1]
      
      puts "coor is #{coor}"
      if y < 7
        if y > 1
          if board[-y][@converter.call((x + 1))] == "_" && board[-(y - 1)][@converter.call((x + 1))] != "_"
            if x < 7
              5.times{move_options << (x + 1)}
            end
          end

          if board[-y][@converter.call((x - 1))] == "_" && board[-(y - 1)][@converter.call((x - 1))] != "_"
            if x > 1
              5.times{move_options << (x - 1)}    
            end        
          end
        end
        if x < 7
          if board[-(y + 1)][@converter.call((x + 1))] == "_"
            5.times{move_options << (x + 1)}

          elsif board[-(y + 2)][@converter.call((x + 1))] == "_"
            5.times{move_options << (x + 1)}
          end
        end

        if x > 1
          if board[-(y + 1)][@converter.call((x - 1))] == "_"
            5.times{move_options << (x - 1)}

          elsif board[-(y + 2)][@converter.call((x - 1))] == "_"
            5.times{move_options << (x - 1)}
          end
        end

        if board[-(y + 2)][@converter.call((x))] == "_"
          5.times{move_options << (x)}
        end
      end

    end

    if v_player_block(player_arr, board).is_a?(Integer)
      35.times{move_options << v_player_block(player_arr, board)}
    end
    if h_player_block(player_arr, board).is_a?(Integer)
      35.times{move_options << h_player_block(player_arr, board)}
    end
    if d_player_block(player_arr, board).is_a?(Integer)
      35.times{move_options << d_player_block(player_arr, board)}
    end
    
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