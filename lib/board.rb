class Board
	attr_accessor :active_board
	def initialize(size)
		@active_board = setup_new_board(size)
	end

	def update(player,move)
		x = move[0]
		y = move[1]
		@active_board[x][y] = player
	end

	private

	def setup_new_board(size)
		empty_board = []
		size.times do |x|
			empty_board << []
			size.times do |y|
				empty_board[x] << ""
			end
		end
		empty_board
	end
end