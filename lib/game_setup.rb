require_relative "player.rb"
require_relative "comp_player.rb"

class GameSetup

	def determine_players
		gets.chomp.to_i
	end

	def valid?(player)
		if player == 1 or player == 2
			return true
		end
		false
	end

	def set_player_two(players,game_board,game,o_marker,x_marker)
		if players == 1
			return CompPlayer.new(game_board,game,o_marker,x_marker)
		else
			return Player.new(game_board)
		end
	end

end