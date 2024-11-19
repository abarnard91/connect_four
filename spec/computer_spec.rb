require "./lib/board.rb"
require "./lib/computer.rb"

describe Computer do
  describe "#computer_move" do
    it "chooses a random number between 1-7" do
      board = Board.new
      computer = Computer.new

      board.empty_board

      def num_to_spot(num)
        return num*4-2
      end
      

      expect(computer.computer_move).to be_between(1,7).inclusive
    end
  end
end