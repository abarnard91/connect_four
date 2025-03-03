require "json"
require_relative "lib/board.rb"
require_relative 'lib/player.rb'
require_relative "lib/computer.rb"
game_loop = true

def end_game(poc,player, computer, game_board) #poc = player or computer
  poc.score += 1
  if poc == player
    puts "You win! Your score is #{poc.score}"
  else
    puts "Computer Wins! Computer score is #{poc.score}"
  end
    
  play_again = game_board.play_again(player, computer)
  if play_again == true
    return Board.new 
  else
    return false
  end
end

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
  begin
    game_board = Board.from_json('game_save.json')
    player = Player.from_json("player_save.json")
    computer = Computer.from_json("computer_save.json") 
    
  rescue StandardError
    puts "There is a file issue, so we'll start a new game instead."
    game_board = Board.new
    player = Player.new
    computer = Computer.new
  end
  puts game_board.board
end

###GAME LOOP###
while game_loop 
  game_board.complete_move = false
  while game_board.complete_move == false
    game_board.drop_chip(player.player_move, player.chip)
    #puts game_board.complete_move
    
    if player.saq == true
      game_board.to_json
      player.to_json
      computer.to_json
      player.quit = true
      break
    end

    if player.reset == true
      game_board = Board.new
      game_board.complete_move = false
      player.reset = false
      game_board.drop_chip(player.player_move, player.chip)
      
    end

    if player.quit == true
      game_loop = false
      break
    end

    #puts "player check for win"
    game_board.check_for_win(game_board.player_moves_arr)
    draw_game = game_board.check_for_draw
    if draw_game 
      game_board.winner = true
    end
  end
  
  if player.quit == true
    break
  end
  puts game_board.board
  if game_board.winner == true
    game_board = end_game(player, player, computer, game_board)
    if game_board == false
      break
    end
  end

  

  game_board.complete_move = false
  while game_board.complete_move == false
    game_board.drop_chip(computer.complex_computer_move(game_board.board,game_board.computer_moves_arr, game_board.player_moves_arr), computer.chip)
   # puts game_board.complete_move
  end
  puts game_board.board
  #puts "computer check for win"
  game_board.check_for_win(game_board.computer_moves_arr)
  draw_game = game_board.check_for_draw
    if draw_game 
      game_board.winner = true
    end

  if game_board.winner == true
    game_board = end_game(computer, player, computer, game_board)
    if game_board == false
      game_loop = false
    end
  end

end

