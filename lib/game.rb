class Game
	attr_accessor :board
	def initialize
		@board = [["","",""],["","",""],["","",""]]
	end

	def any_available_moves?(board=@board)
		3.times do |i|
			3.times do |j|
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

	def test_winning_moves(board=@board)
		3.times do |r|
			if board[r][0] == board[r][1] && board[r][1] == board[r][2]
				if board[r][0] == "X"
					return 10
				elsif board[r][0] == "O"
					return -10
				end
			end
		end

		3.times do |c|
			if board[0][c] == board[1][c] && board[1][c] == board[2][c]
				if board[0][c] == "X"
					return 10
				elsif board[0][c] == "O"
					return -10
				end
			end
		end

		if (board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
			(board[0][2] == board[1][1] && board[1][1] == board[2][0])
			if board[1][1] == "X"
				return 10
			elsif board[1][1] == "O"
				return -10
			end
		end
		0
	end

	def draw_board
		3.times do |i|
			row = 3 - i
			print row.to_s + " | "
			3.times do |j|
				if @board[i][j] == ""
					print "  "
				else
					print " " + @board[i][j]
				end
				if j < 2
					print " |"
				end 				
			end
			if i < 2
				puts "\n  | ---+---+---"
			end
		end
		puts "\n  |____________"
		puts "     a | b | c"
		puts ""
	end
	
	
end
