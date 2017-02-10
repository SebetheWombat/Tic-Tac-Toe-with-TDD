class Board
	attr_accessor :active_board
	def initialize(size=3)
		@active_board = setup_new_board(size)
	end

	def update(players_marker,players_move)
		x = players_move[0]
		y = players_move[1]
		@active_board[x][y] = players_marker
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