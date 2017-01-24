class Game
	attr_accessor :board
	def initialize(board_size = 3)
		@board = []
		board_size.times do |x|
			@board << []
			board_size.times do |y|
				@board[x] << ""
			end
		end
		@board_size = board_size
	end

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

	def update_board(player,move)
		x = move[0]
		y = move[1]
		@board[x][y] = player
	end

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

	def draw_board
		@board_size.times do |i|
			row = @board_size - i
			print row.to_s + " | "
			@board_size.times do |j|
				if @board[i][j] == ""
					print "  "
				else
					print " " + @board[i][j]
				end
				if j < @board_size - 1
					print " |"
				end 				
			end
			if i < @board_size - 1
				puts "\n  | ---+---+---"
			end
		end
		puts "\n  |____________"
		puts "     a | b | c"
		puts ""
	end
	
	
end
