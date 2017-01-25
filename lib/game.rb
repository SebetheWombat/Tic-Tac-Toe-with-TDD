class Game
	attr_accessor :board
	def initialize(board_size = 3)
		#board functionality
		@board = []
		board_size.times do |x|
			@board << []
			board_size.times do |y|
				@board[x] << ""
			end
		end
		@board_size = board_size
	end

	#game state functionality
	def any_available_moves?(board=@board)
		@board_size.times do |i|
			@board_size.times do |j|
				if board[i][j] == ""
					return  true
				end
			end
		end
		false
	end

	#board functionality
	def update_board(player,move)
		x = move[0]
		y = move[1]
		@board[x][y] = player
	end

	#game state functionality
	def test_winning_moves(x_marker,o_marker,board=@board)
		#row win
		@board.each do |row|
			if row.all? {|m| m == o_marker}
				return 10
			elsif row.all? {|m| m == x_marker}
				return -10
			end
		end

		#column win
		@board_size.times do |r|
			column_counter = 1
			(@board_size-1).times do |c|
				if board[c][r] == board[c+1][r]
					column_counter += 1
				end
			end
			if column_counter == @board_size
				if board[0][r] == o_marker
					return 10
				elsif board[0][r] == x_marker
					return -10
				end
			end
		end

		#Diagonal win test
		right_diag = (0...@board_size).map { |i| board[i][i]}
		if right_diag.all? {|m| m == o_marker}
			return 10
		elsif right_diag.all? {|m| m == x_marker}
			return -10
		end

		left_diag = (0...@board_size).map { |i| board[i][@board_size - i - 1]}
		if left_diag.all? {|m| m == o_marker}
			return 10
		elsif left_diag.all? {|m| m ==x_marker}
			return -10
		end	
		0
	end

	#game state functionality
	def outcome(x,o)
		points = test_winning_moves(x,o)
		if points == 10
			return "Computer Victory!\n\n"
		elsif points == -10
			return "Human Victory!\n\n"
		elsif !any_available_moves?
			return "Looks like a tie.\n\n"
		end
		return "active"
	end

	
	
	
end
