require_relative "lib/game_state_checker.rb"
require_relative "lib/player.rb"
require_relative "lib/comp_player.rb"
require_relative "lib/display.rb"
require_relative "lib/board.rb"
require_relative "lib/game_setup.rb"

x_marker = "X"
o_marker = "O"
display = Display.new
game_setup = GameSetup.new
puts display.instructions

puts "What size game board would you like? (Enter 3, 4, or 5)"
board_size = game_setup.get_number_from_user
until game_setup.board_size_valid?(board_size)
	puts "Enter 3, 4, or 5"
	board_size = game_setup.get_number_from_user
end

game_state = GameStateChecker.new(board_size)
board = Board.new(board_size)
active_game_board = board.active_board
playerX = Player.new(active_game_board)

puts "Choose 1 or 2 players"
number_of_players = game_setup.get_number_from_user
until game_setup.number_players_valid?(number_of_players)
	puts "Choose 1 or 2 players"
	number_of_players = game_setup.get_number_from_user
end

playerO = game_setup.set_player_two(number_of_players,active_game_board,game_state,o_marker,x_marker)

while game_state.any_available_moves?(active_game_board)
	display.draw_board(active_game_board)
	puts "Player one your move: "
	playerX_move = playerX.make_move
	board.update(x_marker,playerX_move)
	break if game_state.outcome(x_marker,o_marker,active_game_board) != "active"
	display.draw_board(active_game_board)
	puts "Player two your move: "
	playerO_move = playerO.make_move
	board.update(o_marker,playerO_move)	
	break if game_state.outcome(x_marker,o_marker,active_game_board) != "active"
end

puts game_state.outcome(x_marker,o_marker,active_game_board)
display.draw_board(active_game_board)
puts "Game Over!"

