require "./lib/board.rb"
require "./lib/computer.rb"

describe Computer do
  describe "#computer_move" do
    it "chooses a random number between 1-7" do
      board = Board.new
      computer = Computer.new
      player = Player.new
      # board.drop_chip(5,computer.chip)
      # board.drop_chip(6,player.chip)
      # board.drop_chip(2,computer.chip)
      # board.drop_chip(4,player.chip)
      
      board.drop_chip(computer.complex_computer_move(board.board,board.computer_moves_arr),computer.chip)
      board.drop_chip(computer.complex_computer_move(board.board,board.computer_moves_arr),computer.chip)
      board.drop_chip(computer.complex_computer_move(board.board,board.computer_moves_arr),computer.chip)


      puts board.board

      # def num_to_spot(num)
      #   return num*4-2
      # end
      
      expect(computer.computer_move).to be_between(1,7).inclusive
      expect(computer.complex_computer_move(board.board)).to be_between(1,7).inclusive
    end
  end
end