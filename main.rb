require_relative "lib/board.rb"
require_relative 'lib/player.rb'
require_relative "lib/computer.rb"

game_board = Board.new
player = Player.new
computer = Computer.new

game_board.empty_board
#puts game_board.board

game_board.drop_chip(player.player_move,player.chip)
game_board.drop_chip(3,computer.chip)

puts game_board.board


#game_board.empty_board
#puts game_board.board