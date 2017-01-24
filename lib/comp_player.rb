#TODO: make find_best_move more efficient to work with 4x4 game
class CompPlayer < Player
	
	def minimax(comp_turn, depth, board)
		points = @game.test_winning_moves(@opponents_marker,@players_marker,board)

		if points == 10
			return points
		end
		if points == -10 
			return points 
		end
		if !@game.any_available_moves?(board)
			return 0
		end

		if comp_turn
			traverse_board_depth(-9999,depth,board,@players_marker,comp_turn)
		else
			traverse_board_depth(9999,depth,board,@opponents_marker,comp_turn)
		end
	end

	def traverse_board_depth(best_score,depth,board,player_marker,comp_turn)
		@board_size.times do |i|
			@board_size.times do |j|
				if board[i][j] == ""
					board[i][j] = player_marker
					if comp_turn
						best_score = [best_score, minimax(false, depth+1, board)].max
					else
						best_score = [best_score, minimax(true, depth+1, board)].min
					end
					board[i][j] = ""
				end
			end
		end
		best_score
	end

	def find_best_move(board = @board)
		best_move = -9999
		@board_size.times do |i|
			@board_size.times do |j|
				if board[i][j] == ""
					board[i][j] = @players_marker
					test_move = minimax(false,0,board)
					board[i][j] = ""
					if test_move > best_move
						@move = [i,j]
						best_move = test_move
					end
				end
			end
		end
	end
end

