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

	def active_game_state?
		points = test_winning_moves("X","O")
		if points == 10
			puts "Computer Victory!\n\n"
			return false
		elsif points == -10
			puts "Human Victory!\n\n"
			return false
		elsif !any_available_moves?
			return false
		end
		true
	end

	def draw_board
		col = []
		@board_size.times do |i|
			row = @board_size - i
			col << i
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
				puts "\n  | " + "---+" * (@board_size - 1) + "---"
			end
		end
		puts "\n  |" + "____" * @board_size
		print "    "
		col.each do |c|
			print c == @board_size-1? " #{(c + 97).chr} ": " #{(c + 97).chr} |"
		end
		puts "\n\n"
	end
	
	
end
