require_relative "lib/game.rb"
require_relative "lib/player.rb"
require_relative "lib/comp_player.rb"

game = Game.new
human = Player.new(game)
computer = CompPlayer.new(game)

puts "\n\nHello human! I challenge you to a game of tic tac toe!"
puts "What's that? You never heard of tic tac toe? \nWell it's okay because I am a computer so I know many things."
puts "You want to connect a line of three. \nYou won't because I'm just that good but you can still try."
puts "To make a move just type in the position on the board where you would like to place your marker. \nFor example type a1 to claim the bottom left corner or c3 to claim the top right."
puts "I'll even let you go first because I am a gracious winner.\n\n"

while game.any_available_moves?
	game.draw_board
	puts "Your move: "
	until human.is_move_valid?
		human.make_move
		puts ""
		if !human.is_move_valid?
			puts "Sorry what was that?"
		end
	end
	game.update_board("O",human.move)
	computer.find_best_move
	game.update_board("X",computer.move)
	points = game.test_winning_moves
	if points == 10
		puts "\nComputer Victory!\n\n"
		break
	elsif points == -10
		puts "\nHuman Victory!\n\n"
		break
	end
end

if game.test_winning_moves == 0
	puts "Looks like a tie"
end
game.draw_board
puts "Game Over!"