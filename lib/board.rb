class Board
  attr_accessor :board, :r1, :r2, :r3, :r4, :r5, :r6, :moves

  def initialize
    @board = nil
    #@moves = Hash.new()
  
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
    @board.reverse.each do |spot|
      if spot[x] == "_"
        spot[x] = chip
        
        return spot[x], @moves
      end
    end
  end

end