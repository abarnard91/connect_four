module Win_moves

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
        return  true
      end
    end
    return false
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
        return  true
      else
        
      end
    end
    return false
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
        return true
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
        return true
      end
    end
    return false
  end

end