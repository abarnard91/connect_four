require_relative "lib/board.rb"
require_relative 'lib/player.rb'
require_relative "lib/computer.rb"

game_board = Board.new
player = Player.new
computer = Computer.new

game_board.empty_board

puts game_board.board
#puts "#{game_board.player_moves_arr.sort!}"
#game_board.diagonal_win(game_board.computer_moves_arr)
puts game_board.winner
#game_board.winner = false
game_board.diagonal_win(game_board.player_moves_arr)
puts game_board.winner
# 6.times do
#   game_board.drop_chip(player.player_move,player.chip)
#   game_board.drop_chip(computer.computer_move,computer.chip)

#   puts game_board.board
# end
#game_board.empty_board
#puts game_board.board