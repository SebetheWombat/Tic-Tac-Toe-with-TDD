class Game
	def player_makes_move(player)
		move = [-1,-1]
		until player.is_move_valid?(move)
			move = player.make_move
			puts ""
			if !player.is_move_valid?(move)
				puts "Sorry what was that?"
			end
		end
		move
	end
end