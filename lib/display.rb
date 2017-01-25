class Display
	def draw_board(board)
		board_size = board.length
		col = []
		board_size.times do |i|
			row = board_size - i
			col << i
			print row.to_s + " | "
			board_size.times do |j|
				if board[i][j] == ""
					print "  "
				else
					print " " + board[i][j]
				end
				if j < board_size - 1
					print " |"
				end 				
			end
			if i < board_size - 1
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