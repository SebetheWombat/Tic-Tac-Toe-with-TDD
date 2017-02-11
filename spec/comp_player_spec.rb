require_relative "../lib/player.rb"
require_relative "../lib/comp_player.rb"
require_relative "../lib/game_state_checker.rb"
require_relative "../lib/board.rb"

RSpec.describe CompPlayer do
    before(:each) do
        game = GameStateChecker.new
        board = Board.new
        game_board = board.active_board
        @comp_player = CompPlayer.new(game_board,game,"O","X")
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