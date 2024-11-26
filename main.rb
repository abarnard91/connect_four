require_relative "lib/board.rb"
require_relative 'lib/player.rb'
require_relative "lib/computer.rb"

game_board = Board.new
player = Player.new
computer = Computer.new

game_board.empty_board
7.times do
  game_board.drop_chip(3, player.chip)
end

puts game_board.board
