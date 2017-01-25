require_relative "lib/game.rb"
require_relative "lib/player.rb"
require_relative "lib/comp_player.rb"
require_relative "lib/display.rb"
require_relative "lib/board.rb"
require_relative "lib/game_setup.rb"

x_marker = "X"
o_marker = "O"
game = Game.new
board = Board.new()
game_board = board.board
display = Display.new
player_one = Player.new(game_board,game,x_marker,o_marker)
game_setup = GameSetup.new

puts game_setup.instructions

puts "Choose 1 or 2 players"
players = game_setup.determine_players
until game_setup.valid?(players)
	puts "Choose 1 or 2 players"
	players = game_setup.determine_players
end

player_two = game_setup.set_player_two(players,game_board,game,o_marker,x_marker)

while game.any_available_moves?(game_board)
	display.draw_board(game_board)
	puts "Player one your move: "
	move = [-1,-1]
	until player_one.is_move_valid?(move)
		move = player_one.make_move
		puts ""
		if !player_one.is_move_valid?(move)
			puts "Sorry what was that?"
		end
	end
	board.update(x_marker,move)
	break if game.outcome(x_marker,o_marker,game_board) != "active"
	if players == 1	
		move = player_two.find_best_move
	else
		display.draw_board(game_board)
		puts "Player two your move: "
		until player_two.is_move_valid?(move)
			move = player_two.make_move
			puts ""
			if !player_two.is_move_valid?(move)
				puts "Sorry what was that?"
			end
		end
	end
	board.update(o_marker,move)
	break if game.outcome(x_marker,o_marker,game_board) != "active"
end

puts game.outcome(x_marker,o_marker,game_board)
display.draw_board(game_board)
puts "Game Over!"