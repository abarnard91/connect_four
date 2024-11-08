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

    xit "stores the move as a hash in the @moves array" do
      
      board = Board.new
      player = Player.new
      computer = Computer.new
      board.empty_board
      board.drop_chip(3,player.chip)
      board.drop_chip(3,computer.chip)
      def num_to_spot(num)
        return num*4-2
      end
      
      expect(board.moves).to eql({board.r1[10] => player.chip, board.r2[10] => computer.chip})
    end

  end
end