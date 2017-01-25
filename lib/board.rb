class Board
	attr_accessor :board
	def initialize(board_size = 3)
		@board = []
		board_size.times do |x|
			@board << []
			board_size.times do |y|
				@board[x] << ""
			end
		end
	end

	def update(player,move)
		x = move[0]
		y = move[1]
		@board[x][y] = player
	end
end