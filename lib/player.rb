class Player
	attr_accessor :board
	def initialize(board,game,players_marker,opponents_marker)
		@board = board
		@board_size = board.length
		@game = game
		@players_marker = players_marker
		@opponents_marker = opponents_marker
	end

	def make_move
		move = [-1,-1]
		input = gets.chomp.gsub(" ", "")
		input = input.split("")
		if input.length == 2
			if input[1].to_i > 0
				move[0] = @board_size - input[1].to_i
				move[1] = (input[0].downcase.ord - 97)
			end
		end
		move
	end

	def is_move_valid?(move)
		x = move[0]
		y = move[1]
		if x >= 0 && x <= @board_size && y >= 0 && y <= @board_size && @board[x][y] == ""
			true
		else
			false
		end
	end

end







