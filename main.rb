require "json"
require_relative "lib/board.rb"
require_relative 'lib/player.rb'
require_relative "lib/computer.rb"
game_loop = true


puts """
 ███ ███ █┼┼█ █┼┼█ ███ ███ ███ ┼┼ ███ ███ █┼█ ███
 █┼┼ █┼█ ██▄█ ██▄█ █▄┼ █┼┼ ┼█┼ ┼┼ █▄┼ █┼█ █┼█ █▄┼
 ███ █▄█ █┼██ █┼██ █▄▄ ███ ┼█┼ ┼┼ █┼┼ █▄█ ███ █┼█

Enter
 1. New Game 
 2. Load game 
 (type number only)
"""
start_game_response = gets.chomp

until start_game_response.to_i.between?(1,2)
  puts "Please only enter 1 or 2"
  start_game_response = gets.chomp
end

if start_game_response.to_i == 1
  game_board = Board.new
  player = Player.new
  computer = Computer.new
else
  game_board = Board.new
  puts game_board.r1
  game_board = Board.from_json('game_save.json')
  puts game_board.r1
  player = Player.from_json("player_save.json")
  computer = Computer.from_json("computer_save.json") 
end

###GAME LOOP###
while game_loop == true
  game_board.complete_move = false
  while game_board.complete_move == false
    game_board.drop_chip(player.player_move, player.chip)
    #puts game_board.complete_move
    
    if player.saq == true
      game_board.to_json
      player.to_json
      computer.to_json
      game_board.complete_move = true
      game_loop = false
      break
    end

    puts "player check for win"
    game_board.check_for_win(game_board.player_moves_arr)
  end
  # if player.saq == true
  #   puts "Thanks for playing! See you soon!"
  #   break
  #end

  puts game_board.board

  if game_board.winner == true
    player.score += 1
    puts "You win! Your score is #{player.score}"
    play_again = game_board.play_again(player, computer)
    if play_again == true
      game_board = Board.new 
    else
      game_loop = false
      break
    end
  end

  game_board.complete_move = false
  while game_board.complete_move == false
    game_board.drop_chip(computer.computer_move, computer.chip)
   # puts game_board.complete_move
  end
  puts game_board.board
  puts "computer check for win"
  game_board.check_for_win(game_board.computer_moves_arr)

  if game_board.winner == true
    
    computer.score += 1
    puts "Computer Wins! Computer score is #{computer.score}"
    play_again = game_board.play_again(player, computer)
    if play_again == true
      game_board = Board.new
    else
      game_loop = false
    end
  end

end

