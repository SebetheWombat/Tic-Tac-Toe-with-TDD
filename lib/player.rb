class Player
	attr_accessor :board, :move
	def initialize(game)
		@game = game
		@board = game.board
		@move = [-1,-1]
	end

	def make_move
		input = gets.chomp.gsub(" ", "")
		input = input.split("")
		if input.length != 2
			@move = [-1,-1]
		else
			@move[0] = 3 - input[1].to_i
			@move[1] = (input[0].ord - 97)
		end
	end

	def is_move_valid?
		x = @move[0]
		y = @move[1]
		if x >= 0 && x <= 2 && y >= 0 && y <= 2 && @board[x][y] == ""
			true
		else
			false
		end
	end

end







