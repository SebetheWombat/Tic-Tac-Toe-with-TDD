class CompPlayer < Player
	
	def minimax(comp_turn, depth, board)
		points = @game.test_winning_moves(board)

		if points == 10
			return points - depth
		end
		if points == -10 
			return points + depth
		end
		if !@game.any_available_moves?(board)
			return 0
		end

		if comp_turn
			best_score = -9999
			3.times do |i|
				3.times do |j|
					if board[i][j] == ""
						board[i][j] = "X"
						best_score = [best_score, minimax(false, depth+1, board)].max
						board[i][j] = ""
					end
				end
			end
			return best_score
		else
			best_score = 9999
			3.times do |i|
				3.times do |j|
					if board[i][j] == ""
						board[i][j] = "O"
						best_score = [best_score, minimax(true, depth+1, board)].min
						board[i][j] = ""
					end
				end
			end
			return best_score
		end

	end

	def find_best_move(board = @board)
		best_move = -9999
		3.times do |i|
			3.times do |j|
				if board[i][j] == ""
					board[i][j] = "X"
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

