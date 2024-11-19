require "./lib/player.rb"
require "./lib/board.rb"

describe Player do
  describe "#player_move" do
    xit "Received player input and runs the drop_chip method from Board class" do
      board = Board.new
      player = Player.new
      board.empty_board
      
      board.drop_chip(player.player_move, player.chip)
      def num_to_spot(num)
        return num*4-2
      end
      expect(board.r1[num_to_spot(5)]).to eql(player.chip)


    end
  end
end