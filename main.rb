require_relative "lib/board.rb"
require_relative 'lib/player.rb'
require_relative "lib/computer.rb"

game_board = Board.new
player = Player.new
computer = Computer.new

#game_board.empty_board
while game_board.winner == false
  game_board.complete_move = false
  while game_board.complete_move == false
    game_board.drop_chip(player.player_move, player.chip)
    #puts game_board.complete_move
    game_board.check_for_win(game_board.player_moves_arr)
  end
  puts game_board.board
  if game_board.winner == true
    break
  end
  game_board.complete_move = false
  while game_board.complete_move == false
    game_board.drop_chip(computer.computer_move, computer.chip)
   # puts game_board.complete_move
  end
  puts game_board.board
  game_board.check_for_win(game_board.computer_moves_arr)
end

#puts game_board.board
