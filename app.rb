require_relative "lib/game_state_checker.rb"
require_relative "lib/game.rb"
require_relative "lib/player.rb"
require_relative "lib/comp_player.rb"
require_relative "lib/display.rb"
require_relative "lib/board.rb"
require_relative "lib/game_setup.rb"

x_marker = "X"
o_marker = "O"
game_state = GameStateChecker.new
current_game = Game.new
board = Board.new()
game_board = board.board
display = Display.new
player_one = Player.new(game_board,x_marker,o_marker)
game_setup = GameSetup.new

puts game_setup.instructions

puts "Choose 1 or 2 players"
players = game_setup.determine_players
until game_setup.valid?(players)
	puts "Choose 1 or 2 players"
	players = game_setup.determine_players
end

player_two = game_setup.set_player_two(players,game_board,game_state,o_marker,x_marker)

while game_state.any_available_moves?(game_board)
	display.draw_board(game_board)
	puts "Player one your move: "
	move = current_game.player_makes_move(player_one)
	board.update(x_marker,move)
	break if game_state.outcome(x_marker,o_marker,game_board) != "active"
	display.draw_board(game_board)
	puts "Player two your move: "
	move = current_game.player_makes_move(player_two)
	board.update(o_marker,move)
	break if game_state.outcome(x_marker,o_marker,game_board) != "active"
end

puts game_state.outcome(x_marker,o_marker,game_board)
display.draw_board(game_board)
puts "Game Over!"

