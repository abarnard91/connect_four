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

  def complex_computer_move(board, comp_move_arr=[])
    move_options = [1,2,3,4,5,6,7]
    #move_options = [2,5,5] #for debugging
    comp_move_arr.each do |coor|
      x = coor[0]
      y = coor[1]
      z = -> (x_cor){(x_cor*4)-2} #lamba to convert x coordinate from 1-7 to array index (ie 2 = rx[6] (where x is 1-6))
      #for checking on either side of the chip
      #ex: chip dropped on spot 4 row 1 (ie coor=[4,1])
      #check for spot [3,1] and [5,1] to be free
      #if left or right not free next check the spot right above
      #
      puts "coor is #{coor}"
      if y < 7
        if y > 1
          if board[-y][z.call((x + 1))] == "_" && board[-(y - 1)][z.call((x + 1))] != "_"
            if x < 7
            # puts "bottem right diagonal empty!!!"
              5.times{move_options << (x + 1)}
            end
          end

          if board[-y][z.call((x - 1))] == "_" && board[-(y - 1)][z.call((x - 1))] != "_"
            if x > 1
              #puts "bottem left diagonal empty!!!"
              5.times{move_options << (x - 1)}    
            end        
          end
        end
        if x < 7
          if board[-(y + 1)][z.call((x + 1))] == "_"
            #puts "right spot empty!!!"
            5.times{move_options << (x + 1)}

          elsif board[-(y + 2)][z.call((x + 1))] == "_"
            #puts "top right diagonal empty!!!"
            5.times{move_options << (x + 1)}
          end
        end

        if x > 1
          if board[-(y + 1)][z.call((x - 1))] == "_"
            #puts "left spot empty!!!"
            5.times{move_options << (x - 1)}

          elsif board[-(y + 2)][z.call((x - 1))] == "_"
            #puts "top left diagonal empty!!!"
            5.times{move_options << (x - 1)}
          end
        end

        if board[-(y + 2)][z.call((x))] == "_"
          #puts "spot above open!!!"
          5.times{move_options << (x)}
        end
      end

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