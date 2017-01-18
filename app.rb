require_relative "lib/game.rb"
require_relative "lib/player.rb"
require_relative "lib/comp_player.rb"

game = Game.new
human = Player.new(game)
computer = CompPlayer.new(game)

while game.any_available_moves?
	game.draw_board
	puts "Your move: "
	until human.is_move_valid?
		human.make_move
	end
	game.update_board("O",human.move)
	computer.find_best_move
	game.update_board("X",computer.move)
	points = game.test_winning_moves
	if points == 10
		puts "Computer Victory!"
		break
	elsif points == -10
		puts "Human Victory!"
		break
	end
end

game.draw_board
puts "Game Over!"