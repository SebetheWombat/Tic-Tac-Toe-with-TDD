class Display
	def instructions
		text = %q(
		You are about to play a game of tic tac toe. 
		The aim of this classic game is to complete a row, column or diagonal.
		To make a move type in the position where you would like to place your marker. 
		For example type a1 to claim the bottom left corner or c3 to claim the top right.
		
		)
		text.gsub("\t","")
	end

	def draw_board(board)
		board_size = board.length
		col = []
		board_size.times do |x|
			row = board_size - x
			col << x
			print row.to_s + " | "
			board_size.times do |y|
				if board[x][y] == ""
					print "  "
				else
					print " " + board[x][y]
				end
				if y < board_size - 1
					print " |"
				end 				
			end
			if x < board_size - 1
				puts "\n  | " + "---+" * (board_size - 1) + "---"
			end
		end
		puts "\n  |" + "____" * board_size
		print "    "
		col.each do |c|
			print c == board_size-1? " #{(c + 97).chr} ": " #{(c + 97).chr} |"
		end
		puts "\n\n"
	end
end