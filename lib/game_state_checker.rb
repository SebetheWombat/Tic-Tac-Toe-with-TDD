class GameStateChecker
    def initialize(board_size = 3)
        @board_size = board_size
    end

    def any_available_moves?(board)
        @board_size.times do |x|
            @board_size.times do |y|
                if board[x][y] == ""
                    return  true
                end
            end
        end
        false
    end
    
    def test_winning_moves(x_marker,o_marker,board)        
        diagonal_right = check_diagonal_right_win(x_marker,o_marker,board)
        diagonal_left = check_diagonal_left_win(x_marker,o_marker,board)
        columns = check_col_win(x_marker,o_marker,board)
        rows = check_row_win(x_marker,o_marker,board)

        [rows,columns,diagonal_right,diagonal_left].reduce(:+)
    end

    private

    def check_diagonal_right_win(x_marker,o_marker,board)
        right_diagonal = (0...@board_size).map { |i| board[i][i]}
        if right_diagonal.all? {|board_space| board_space == o_marker}
            return 10
        elsif right_diagonal.all? {|board_space| board_space == x_marker}
            return -10
        end
        0
    end

    def check_diagonal_left_win(x_marker,o_marker,board)
        left_diagonal = (0...@board_size).map { |i| board[i][@board_size - i - 1]}
        if left_diagonal.all? {|board_space| board_space == o_marker}
            return 10
        elsif left_diagonal.all? {|board_space| board_space == x_marker}
            return -10
        end
        0
    end

    def check_col_win(x_marker,o_marker,board)
        temp_board = board.transpose
        temp_board.each do |column|
            if column.all? {|board_space| board_space == o_marker}
                return 10
            elsif column.all? {|board_space| board_space == x_marker}
                return -10
            end
        end
        0
    end

    def check_row_win(x_marker,o_marker,board)
        board.each do |row|
            if row.all? {|board_space| board_space == o_marker}
                return 10
            elsif row.all? {|board_space| board_space == x_marker}
                return -10
            end
        end
        0
    end

    public
    
    def outcome(x_marker,o_marker,board)
        points = test_winning_moves(x_marker,o_marker,board)
        if points == 10
            return "#{o_marker} is the winner!\n\n"
        elsif points == -10
            return "#{x_marker} is the winner!\n\n"
        elsif !any_available_moves?(board)
            return "Looks like a tie.\n\n"
        end
        return "active"
    end
    
end
