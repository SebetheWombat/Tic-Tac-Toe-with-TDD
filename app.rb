require_relative "lib/game.rb"
require_relative "lib/player.rb"
require_relative "lib/comp_player.rb"
require_relative "lib/display.rb"
require_relative "lib/board.rb"

x_marker = "X"
o_marker = "O"
game = Game.new
board = Board.new()
game_board = board.board
display = Display.new
human = Player.new(game_board,game,x_marker,o_marker)
computer = CompPlayer.new(game_board,game,o_marker,x_marker)

puts "\n\nHello human! I challenge you to a game of tic tac toe!"
puts "What's that? You never heard of tic tac toe? \nWell it's okay because I am a computer so I know many things."
puts "You want to connect a line of three. \nYou won't because I'm just that good but you can still try."
puts "To make a move just type in the position on the board where you would like to place your marker. \nFor example type a1 to claim the bottom left corner or c3 to claim the top right."
puts "I'll even let you go first because I am a gracious winner.\n\n"

while game.any_available_moves?(game_board)
	display.draw_board(game_board)
	puts "Your move: "
	move = [-1,-1]
	until human.is_move_valid?(move)
		move = human.make_move
		puts ""
		if !human.is_move_valid?(move)
			puts "Sorry what was that?"
		end
	end
	board.update(x_marker,move)
	break if game.outcome(x_marker,o_marker,game_board) != "active"
	move = computer.find_best_move
	board.update(o_marker,move)
	break if game.outcome(x_marker,o_marker,game_board) != "active"
end

puts game.outcome(x_marker,o_marker,game_board)
display.draw_board(game_board)
puts "Game Over!"