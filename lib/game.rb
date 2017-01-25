class Game
    def any_available_moves?(board)
        board_size = board.length
        board_size.times do |i|
            board_size.times do |j|
                if board[i][j] == ""
                    return  true
                end
            end
        end
        false
    end
    
    def test_winning_moves(x_marker,o_marker,board)
        board_size = board.length
        #row win
        board.each do |row|
            if row.all? {|m| m == o_marker}
                return 10
            elsif row.all? {|m| m == x_marker}
                return -10
            end
        end

        #column win
        board_size.times do |r|
            column_counter = 1
            (board_size-1).times do |c|
                if board[c][r] == board[c+1][r]
                    column_counter += 1
                end
            end
            if column_counter == board_size
                if board[0][r] == o_marker
                    return 10
                elsif board[0][r] == x_marker
                    return -10
                end
            end
        end

        #Diagonal win test
        right_diag = (0...board_size).map { |i| board[i][i]}
        if right_diag.all? {|m| m == o_marker}
            return 10
        elsif right_diag.all? {|m| m == x_marker}
            return -10
        end

        left_diag = (0...board_size).map { |i| board[i][board_size - i - 1]}
        if left_diag.all? {|m| m == o_marker}
            return 10
        elsif left_diag.all? {|m| m ==x_marker}
            return -10
        end 
        0
    end

    def outcome(x,o,board)
        points = test_winning_moves(x,o,board)
        if points == 10
            return "Computer Victory!\n\n"
        elsif points == -10
            return "Human Victory!\n\n"
        elsif !any_available_moves?(board)
            return "Looks like a tie.\n\n"
        end
        return "active"
    end
    
end
