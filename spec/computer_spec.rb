require "./lib/board.rb"
require "./lib/computer.rb"

describe Computer do
  describe "#h_player_block" do
    it "reads through the player moves and possible move options on the board. If there is a 3-in-a-row horizontally and there is a possibility that the player will be able to connect 4 the next move either to the left or right of the 3 in a row, it returns the drop spot number for that spot" do
      board = Board.new
      computer = Computer.new
      player = Player.new

      board.drop_chip(2,player.chip)
      board.drop_chip(3,player.chip)
      board.drop_chip(4,player.chip)

      puts board.board
      expect(computer.h_player_block(board.player_moves_arr,board.board)).to eql(1)


      board = Board.new

      board.drop_chip(7,player.chip)
      board.drop_chip(6,player.chip)
      board.drop_chip(5,player.chip)
      puts board.board
      expect(computer.h_player_block(board.player_moves_arr,board.board)).to eql(4)

      board = Board.new
      board.drop_chip(2,player.chip)
      board.drop_chip(4,player.chip)
      board.drop_chip(5,player.chip)
      puts board.board

      expect(computer.h_player_block(board.player_moves_arr,board.board)).to eql("no match")

      board = Board.new
      board.drop_chip(3,computer.chip)
      board.drop_chip(4,computer.chip)
      board.drop_chip(5,computer.chip)
      board.drop_chip(3,player.chip)
      board.drop_chip(4,player.chip)
      board.drop_chip(5,player.chip)
      puts board.board

      expect(computer.h_player_block(board.player_moves_arr,board.board)).to eql("no match")

    end
  end
  describe "#v_player_block" do
    it "reads through the player moves and possible move options on the board. If there is a 3-in-a-row vertically and there is a possibility that the player will be able to connect 4 the next move, it returns the drop spot number for that spot" do
      board = Board.new
      computer = Computer.new
      player = Player.new

      board.drop_chip(1, player.chip)
      board.drop_chip(1, player.chip)
      board.drop_chip(1, player.chip)

      puts board.board
      expect(computer.v_player_block(board.player_moves_arr, board.board)).to eql(1)
      #expect(computer.complex_computer_move(board.board, board.computer_moves_arr, board.player_moves_arr)).to eql(1)

      board = Board.new

      board.drop_chip(3, player.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(3, player.chip)
      
      puts board.board
      expect(computer.v_player_block(board.player_moves_arr, board.board)).to eql("no match")

      board = Board.new

      board.drop_chip(5, player.chip)
      board.drop_chip(5, player.chip)
      board.drop_chip(5, player.chip)
      board.drop_chip(5, computer.chip)
      puts board.board
      
     
      expect(computer.v_player_block(board.player_moves_arr, board.board)).to eql("no match")


      board = Board.new

      board.drop_chip(7, computer.chip)
      board.drop_chip(7, computer.chip)
      board.drop_chip(7, player.chip)
      board.drop_chip(7, player.chip)
      board.drop_chip(7, player.chip)
      
      puts board.board
      expect(computer.v_player_block(board.player_moves_arr, board.board)).to eql(7)


    end
  end
  describe "#d_player_block" do
    it "reads through the player moves and possible move options on the board. If there is a 3-in-a-row diagonally (up or down) and there is a possibility that the player will be able to connect 4 the next move either to the left or right of the 3 in a row, it returns the drop spot number for that spot" do 
      board = Board.new
      computer = Computer.new
      player = Player.new

      board.drop_chip(3, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(3, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(2, computer.chip)
      board.drop_chip(5, player.chip)
      board.drop_chip(5, computer.chip)
      board.drop_chip(5, player.chip)

      puts "test 1"
      puts board.board
      
      expect(computer.d_player_block(board.player_moves_arr, board.board)).to eql(5)

      board = Board.new
      board.drop_chip(3, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(3, player.chip)
      board.drop_chip(2, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(2, player.chip)

      puts "test 2"
      puts board.board
      
      expect(computer.d_player_block(board.player_moves_arr, board.board)).to eql(5)

      board = Board.new
      board.drop_chip(3, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(3, player.chip)
      board.drop_chip(2, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(5, player.chip)

      puts "test 3"
      puts board.board
     
      expect(computer.d_player_block(board.player_moves_arr, board.board)).to eql(2)
      
      board = Board.new

      board.drop_chip(3, computer.chip)
      board.drop_chip(5, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(3, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(5, player.chip)
      board.drop_chip(5, computer.chip)
      board.drop_chip(5, player.chip)
      
      puts "test 4"
      puts board.board
      
      expect(computer.d_player_block(board.player_moves_arr, board.board)).to eql(2)


      board = Board.new
      board.drop_chip(3, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(3, player.chip)
      board.drop_chip(2, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(5, computer.chip)
      

      puts "test 5"
      puts board.board
      
      expect(computer.d_player_block(board.player_moves_arr, board.board)).to eql("no match")


      board = Board.new
      board.drop_chip(3, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(4, computer.chip)
      board.drop_chip(4, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(2, player.chip)
      board.drop_chip(2, computer.chip)
      board.drop_chip(3, player.chip)
      board.drop_chip(3, computer.chip)
      board.drop_chip(3, player.chip)
      board.drop_chip(1, computer.chip)
      

       puts "test 6"
       puts board.board
      
       expect(computer.d_player_block(board.player_moves_arr, board.board)).to eql("no match")
   
       board = Board.new
       
       board.drop_chip(7, player.chip)
       board.drop_chip(6, computer.chip)
       board.drop_chip(6, player.chip)
       board.drop_chip(5, computer.chip)
       board.drop_chip(4, player.chip)
       board.drop_chip(5, computer.chip)
       board.drop_chip(5, player.chip)
       board.drop_chip(4, computer.chip)
       board.drop_chip(4, player.chip)
       board.drop_chip(3, computer.chip)
       
       
 
        puts "test 7"
        puts board.board
       
        expect(computer.d_player_block(board.player_moves_arr, board.board)).to eql(4)

    end
  end
  describe "#complex_computer_move" do
    it "chooses a random number between 1-7" do
      board = Board.new
      computer = Computer.new
      player = Player.new
       board.drop_chip(5,computer.chip)
       board.drop_chip(6,player.chip)
       board.drop_chip(2,computer.chip)
       board.drop_chip(4,player.chip)
      
      board.drop_chip(computer.complex_computer_move(board.board,board.computer_moves_arr,board.player_moves_arr),computer.chip)
      board.drop_chip(computer.complex_computer_move(board.board,board.computer_moves_arr,board.player_moves_arr),computer.chip)
      board.drop_chip(computer.complex_computer_move(board.board,board.computer_moves_arr,board.player_moves_arr),computer.chip)


      puts board.board

      # def num_to_spot(num)
      #   return num*4-2
      # end
      
      expect(computer.computer_move).to be_between(1,7).inclusive
      expect(computer.complex_computer_move(board.board)).to be_between(1,7).inclusive
    end
  end
end