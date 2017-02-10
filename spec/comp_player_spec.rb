require_relative "../lib/player.rb"
require_relative "../lib/comp_player.rb"
require_relative "../lib/game_state_checker.rb"
require_relative "../lib/board.rb"

RSpec.describe CompPlayer do
    before(:each) do
        game = GameStateChecker.new
        board = Board.new
        game_board = board.board
        @alpha = -9999
        @beta = 9999
        @comp_player = CompPlayer.new(game_board,game,"O","X")
    end

    describe "#minimax" do

        it "should return a positive number for moves that can result in a computer win" do
            board = [["O","",""],
                     ["O","",""],
                     ["","","X"]]
            expect(@comp_player.send(:minimax, true, 0, board,@alpha,@beta)).to be > 0
        end
        it "should return a negative number for moves likely to result in the human player's win" do
            board = [["X","","X"],
                     ["", "",""],
                     ["X","","X"]]
            expect(@comp_player.send(:minimax, true, 0, board,@alpha,@beta)).to be < 0
        end
        it "should return 0 for moves that'll result in a tie" do
            board = [["X","O","X"],
                     ["O","X","X"],
                     ["", "", "O"]]
            expect(@comp_player.send(:minimax, true, 0, board,@alpha,@beta)).to eq(0)
        end
    end

    describe "#traverse_board_depth" do
        it "should return a positive number for moves that can result in a computer win" do
            board = [["O","",""],
                     ["O","",""],
                     ["","","X"]]
            expect(@comp_player.send(:traverse_board_depth, -9999,0,board,"O",true,@alpha,@beta)).to be > 0
        end
        it "should return a negative number for moves likely to result in the human player's win" do
            board = [["X","","X"],
                     ["", "",""],
                     ["X","","X"]]
            expect(@comp_player.send(:traverse_board_depth, 9999,0,board,"X",false,@alpha,@beta)).to be < 0
        end
        it "should return 0 for moves that'll result in a tie" do
            board = [["O","X","O"],
                     ["X","O","O"],
                     ["", "", "X"]]
            expect(@comp_player.send(:traverse_board_depth, 9999,0,board,"X",false,@alpha,@beta)).to eq(0)
        end
    end

    describe "#make_move" do
        it "should update the computer's move to winning move when possible" do
            board = [["X","O",""],
                     ["X","", ""],
                     ["", "","O"]]
            expect(@comp_player.make_move(board)).to eq([2,0])
        end
        it "should update computer's move to block human's move when possible" do
            board = [["X","O",""],
                     ["", "", "X"],
                     ["", "O",""]]
            @comp_player.make_move(board)
            expect(@comp_player.make_move(board)).to eq([1,1])
        end
        it "should return a winning computer move on 4X4 board when possible" do
            board = [["X","","","O"],
                     ["","","O",""],
                     ["","O","","X"],
                     ["","","",""]]
            expect(@comp_player.make_move(board)).to eq([3,0])
        end
    end

end