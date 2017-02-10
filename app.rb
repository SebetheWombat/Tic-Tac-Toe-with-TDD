require_relative "lib/game_state_checker.rb"
require_relative "lib/player.rb"
require_relative "lib/comp_player.rb"
require_relative "lib/display.rb"
require_relative "lib/board.rb"
require_relative "lib/game_setup.rb"

x_marker = "X"
o_marker = "O"
game_state = GameStateChecker.new
display = Display.new
game_setup = GameSetup.new
puts display.instructions

puts "What size game board would you like? (Enter 3, 4, or 5)"
board_size = game_setup.get_number_from_user
until game_setup.board_size_valid?(board_size)
	puts "Enter 3, 4, or 5"
	board_size = game_setup.get_number_from_user
end

board = Board.new(board_size)
game_board = board.board
player_one = Player.new(game_board)

puts "Choose 1 or 2 players"
players = game_setup.get_number_from_user
until game_setup.number_players_valid?(players)
	puts "Choose 1 or 2 players"
	players = game_setup.get_number_from_user
end

player_two = game_setup.set_player_two(players,game_board,game_state,o_marker,x_marker)

while game_state.any_available_moves?(game_board)
	display.draw_board(game_board)
	puts "Player one your move: "
	move = player_one.make_move
	board.update(x_marker,move)
	break if game_state.outcome(x_marker,o_marker,game_board) != "active"
	display.draw_board(game_board)
	puts "Player two your move: "
	move = player_two.make_move
	board.update(o_marker,move)	
	break if game_state.outcome(x_marker,o_marker,game_board) != "active"
end

puts game_state.outcome(x_marker,o_marker,game_board)
display.draw_board(game_board)
puts "Game Over!"

