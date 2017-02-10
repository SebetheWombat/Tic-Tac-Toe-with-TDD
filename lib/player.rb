class Player
	attr_accessor :board
	def initialize(board)
		@board = board
		@board_size = board.length
	end

	def make_move
		move = [-1,-1]
		until is_move_valid?(move)
			move = prompt_for_user(move)
			if !is_move_valid?(move)
				alert_player
			end
		end
		move
	end

	private

	def prompt_for_user(move)
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

	def alert_player
		puts "Sorry what was that?"
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







