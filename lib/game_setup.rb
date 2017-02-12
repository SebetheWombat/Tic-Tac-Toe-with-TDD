require_relative "player.rb"
require_relative "comp_player.rb"

class GameSetup

	def get_number_from_user
		gets.chomp.to_i
	end

	def board_size_valid?(board_size)
		[3,4,5].include?(board_size)
	end

	def number_players_valid?(player)
		player == 1 || player == 2
	end

	def set_player_two(players,game_board,game,o_marker,x_marker)
		return CompPlayer.new(game_board,game,o_marker,x_marker) if players == 1
		return Player.new(game_board)
	end

end