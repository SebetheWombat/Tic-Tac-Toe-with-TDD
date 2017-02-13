class Player
	def initialize(board)
		@board = board
		@board_size = board.length
	end

	def make_move
		move = [-1,-1]
		until is_move_valid?(move)
			move = respond_to_prompt(move)
			if !is_move_valid?(move)
				alert_player
			end
		end
		move
	end

	private

	def respond_to_prompt(move)
		input = gets.chomp.gsub(" ", "")
		input = input.split("")
		if input.length == 2
			if input[1].to_i > 0
				move[0] = @board_size - input[1].to_i
				move[1] = (input[0].downcase.ord - 'a'.ord)
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
		if (0..@board_size).include?(x) && (0..@board_size).include?(y) && @board[x][y] == ""
			true
		else
			false
		end
	end

end







