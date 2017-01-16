class Game
	attr_accessor :board
	def initialize
		@computer = "X"
		@human = "O"
		@board = [["","",""],["","",""],["","",""]]
	end

	def any_available_moves?
		3.times do |i|
			3.times do |j|
				if @board[i][j] == ""
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

	def check_for_winner
		3.times do |r|
			if @board[r][0] == @board[r][1] && @board[r][1] == @board[r][2]
				if @board[r][0] == @computer
					return 10
				elsif @board[r][0] == @human
					return -10
				end
			end
		end

		3.times do |c|
			if @board[0][c] == @board[1][c] && @board[1][c] == @board[2][c]
				if @board[0][c] == @computer
					return 10
				elsif @board[0][c] == @human
					return -10
				end
			end
		end

		if (@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]) ||
			(@board[0][2] == @board[1][1] && @board[1][1] == @board[2][0])
			if @board[1][1] == @computer
				return 10
			elsif @board[1][1] == @human
				return -10
			end
		end
		0
	end
	
end
