require_relative "player.rb"
require_relative "comp_player.rb"

class GameSetup

	def instructions
		text = %q(
		You are about to play a game of tic tac toe. 
		The aim of this classic game is to connect a line of 3.
		To make a move type in the position where you would like to place your marker. 
		For example type a1 to claim the bottom left corner or c3 to claim the top right.
		
		)
		text.gsub("\t","")
	end

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
			return Player.new(game_board,game,o_marker,x_marker)
		end
	end


end