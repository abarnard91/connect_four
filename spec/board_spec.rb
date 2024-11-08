require './lib/board.rb'

describe Board do
  describe "#drop_chip" do
    it "inputs a smiley face based on a number entered" do

      board = Board.new
      board.empty_board
      board.drop_chip(3)
      board.drop_chip(3)
      expect(board.r1[10]).to eql(board.w)

      expect(board.r2[10]).to eql(board.w)
      expect(board.r6[10]).to eql("_")  
    end

  end
end