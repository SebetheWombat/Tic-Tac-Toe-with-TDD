class CompPlayer < Player

	def initialize(board,state_checker,players_marker,opponents_marker)
		@board = board
		@board_size = board.length
		@state_checker = state_checker
		@players_marker = players_marker
		@opponents_marker = opponents_marker
	end

	def make_move(board = @board)
		board_size = board.length
		best_move_score = -9999
		best_move = []
		board_size.times do |x|
			board_size.times do |y|
				if board[x][y] == ""
					board[x][y] = @players_marker
					test_move_score = minimax(false,0,board,-9999,9999)
					board[x][y] = ""
					if test_move_score > best_move_score
						best_move = [x,y]
						best_move_score = test_move_score
					end
				end
			end
		end
		best_move
	end

	private
	
	def minimax(comp_turn, depth, board, alpha, beta)
		points = @state_checker.test_winning_moves(@opponents_marker,@players_marker,board)

		if points == 10 || depth == 5
			return points - depth
		end
		if points == -10 || depth == 5
			return points + depth
		end
		if !@state_checker.any_available_moves?(board)
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
		board_size.times do |x|
			board_size.times do |y|
				if board[x][y] == ""
					board[x][y] = player_marker
					if comp_turn
						best_score = [best_score, minimax(false, depth+1, board,alpha,beta)].max
						alpha = [alpha,best_score].max
					else
						best_score = [best_score, minimax(true, depth+1, board,alpha,beta)].min
						beta = [beta,best_score].min
					end
					board[x][y] = ""
				end
				if beta <= alpha
					break
				end
			end
			if beta <= alpha
				break
			end
		end
		best_score
	end

	
end

