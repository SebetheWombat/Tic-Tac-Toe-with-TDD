class Player
	attr_accessor :board, :move
	def initialize(game)
		@game = game
		@board = game.board
		@move = [-1,-1]
	end

	def make_move
		players_move = gets.chomp
		@move = players_move.split(",")
	end

	def is_move_valid?
		x = @move[0].to_i
		y = @move[1].to_i
		if x >= 0 && x <= 2 && y >= 0 && y <= 2 && @board[x][y] == ""
			true
		else
			false
		end
	end

end
