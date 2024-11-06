require_relative("lib/board.rb")

game_board = Board.new()

puts game_board.board

game_board.add_chip(3)

puts game_board.board

Board.empty_board

puts game_board.board