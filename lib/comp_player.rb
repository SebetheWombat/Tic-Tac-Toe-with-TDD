class CompPlayer < Player
	
	def minimax(comp_turn, depth, board, alpha, beta)
		points = @game.test_winning_moves(@opponents_marker,@players_marker,board)

		if points == 10 || depth == 5
			return points - depth
		end
		if points == -10 || depth == 5
			return points + depth
		end
		if !@game.any_available_moves?(board)
			return 0
		end

		if comp_turn
			traverse_board_depth(-9999,depth,board,@players_marker,comp_turn,alpha,beta)
		else
			traverse_board_depth(9999,depth,board,@opponents_marker,comp_turn,alpha,beta)
		end
	end

	def traverse_board_depth(best_score,depth,board,player_marker,comp_turn,alpha,beta)
		board_size = board.length
		board_size.times do |i|
			board_size.times do |j|
				if board[i][j] == ""
					board[i][j] = player_marker
					if comp_turn
						best_score = [best_score, minimax(false, depth+1, board,alpha,beta)].max
						alpha = [alpha,best_score].max
					else
						best_score = [best_score, minimax(true, depth+1, board,alpha,beta)].min
						beta = [beta,best_score].min
					end
					board[i][j] = ""
					if beta <= alpha
						break
					end
				end
			end
		end
		best_score
	end

	def find_best_move(board = @board)
		board_size = board.length
		best_move = -9999
		move = []
		board_size.times do |i|
			board_size.times do |j|
				if board[i][j] == ""
					board[i][j] = @players_marker
					test_move = minimax(false,0,board,-9999,9999)
					board[i][j] = ""
					if test_move > best_move
						move = [i,j]
						best_move = test_move
					end
				end
			end
		end
		move
	end
end

