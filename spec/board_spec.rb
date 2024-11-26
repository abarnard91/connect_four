require './lib/board.rb'
require './lib/player.rb'
require './lib/computer.rb'

describe Board do
  describe "#empty_board" do
    it "produces an empty 7x6 connect 4 board" do
      board = Board.new
      board.empty_board
      expect(board.board).to eql(
        ["|___|___|___|___|___|___|___|",
         "|___|___|___|___|___|___|___|",
         "|___|___|___|___|___|___|___|",
         "|___|___|___|___|___|___|___|",
         "|___|___|___|___|___|___|___|",
         "|___|___|___|___|___|___|___|",
         "  1   2   3   4   5   6   7  "])

      expect(board.r1).to eql("|___|___|___|___|___|___|___|")
    end
  end

  describe "#drop_chip" do
    it "inputs a smiley face based on a number entered" do

      board = Board.new
      player = Player.new
      computer = Computer.new
      board.empty_board
      board.drop_chip(3,player.chip)
      board.drop_chip(3,computer.chip)
      def num_to_spot(num)
        return num*4-2
      end
      expect(board.r1[num_to_spot(3)]).to eql(player.chip)

      expect(board.r2[num_to_spot(3)]).to eql(computer.chip)
      
    end

    it "doesn't update other spaces on the grid" do
      board = Board.new
      player = Player.new
      board.empty_board
      board.drop_chip(4, player.chip)
      def num_to_spot(num)
        return num*4-2
      end

      expect(board.r2).to eql("|___|___|___|___|___|___|___|")

      expect(board.r1[num_to_spot(3)]).to eql("_")

    end

    it "stores the move as an array in either @player_moves_arr or @computer_moves_arr" do
      
      board = Board.new
      player = Player.new
      computer = Computer.new
      board.empty_board
      board.drop_chip(3, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(6, player.chip)
      board.drop_chip(7, computer.chip)
      def num_to_spot(num)
        return num*4-2
      end
      
      expect(board.player_moves_arr).to eql([[3,1], [6,1]])
      expect(board.computer_moves_arr).to eql([[3,2],[7,1]])
    end

  end

  describe "vertical_win" do 
    it "takes an input of an array of arrays iterates through the outer array (the x axis) and iterates again through each inner array (the y axis). Compares the previous Y value with the current Y value and if current Y value - previous Y value = 1 adds 1 to the count. If the count reaches 4 that means there are 4 sequencial numbers or 4 in a row vertically" do
      board = Board.new
      player = Player.new
      board.empty_board
      board.drop_chip(1,player.chip)
      board.drop_chip(4,player.chip)
      board.drop_chip(2,player.chip)
      board.drop_chip(3,player.chip)
      board.drop_chip(1,player.chip)
      board.drop_chip(3,player.chip)
      board.drop_chip(3,player.chip)
      board.drop_chip(3,player.chip)
      

      expect(board.vertical_win(board.player_moves_arr)).to eql(board.winner = true)

    end
  end

  describe "horizontal_win" do 
    it "takes an input of player or move array of x,y coordinates and sorts them into an array of arrays by the y axis containing each x axis then sees if there are 4 of the same number in any of the y axis arrays" do 
      board = Board.new
      player = Player.new
      comp = Computer.new
      board.empty_board
      board.drop_chip(1,player.chip)
      board.drop_chip(4,player.chip)
      board.drop_chip(5,player.chip)
      board.drop_chip(3,player.chip)
      board.drop_chip(6,player.chip)
      board.drop_chip(3,player.chip)
      4.times {board.drop_chip(comp.computer_move, comp.chip)}

      board.horizontal_win(board.computer_moves_arr)
      expect(board.winner).to eql(false)

      expect(board.horizontal_win(board.player_moves_arr)).to eql(board.winner = true)
      

    end
  end
  describe "diagonal win" do
    it "sorts the array of moves and checks if there is an incremental move of x+1,y+1 or x+1,y-1 through [x+4,y+4] or [x+4,y-4]" do
      game_board = Board.new
      player = Player.new
      computer = Computer.new

      game_board.empty_board
      game_board.drop_chip(1, computer.chip)
      game_board.drop_chip(1, player.chip)
      game_board.drop_chip(2, computer.chip)
      game_board.drop_chip(2, player.chip)

      game_board.drop_chip(3, computer.chip)
      game_board.drop_chip(4, player.chip)
      game_board.drop_chip(4, computer.chip)
      game_board.drop_chip(3, player.chip)


      game_board.drop_chip(4, computer.chip)
      game_board.drop_chip(3, player.chip)
      game_board.drop_chip(2, computer.chip)

      game_board.drop_chip(7, computer.chip)
      game_board.drop_chip(5, player.chip)
      game_board.drop_chip(6, computer.chip)
      game_board.drop_chip(6, player.chip)

      game_board.drop_chip(5, computer.chip)
      game_board.drop_chip(7, player.chip)
      game_board.drop_chip(1, computer.chip)
      game_board.drop_chip(4, player.chip)
      game_board.drop_chip(5, computer.chip)
      game_board.drop_chip(5, player.chip)
      game_board.drop_chip(3, computer.chip)
      game_board.drop_chip(5, player.chip)
      game_board.diagonal_win(game_board.player_moves_arr)

      expect(game_board.winner).to eql(true)

      game_board.winner = true
      game_board.diagonal_win(game_board.computer_moves_arr)
      
      expect(game_board.winner).to eql(true)
    end
  end

end