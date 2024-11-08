require_relative("lib/board.rb")

game_board = Board.new()

game_board.empty_board
#puts game_board.board

game_board.drop_chip(3)

puts"HI!", game_board.board

#game_board.empty_board
#puts game_board.board