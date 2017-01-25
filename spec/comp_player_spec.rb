require_relative "../lib/player.rb"
require_relative "../lib/comp_player.rb"
require_relative "../lib/game.rb"

RSpec.describe CompPlayer do
    before(:each) do
        game = Game.new
        @alpha = -9999
        @beta = 9999
        @comp_player = CompPlayer.new(game,"O","X")
    end

    describe "#minimax" do
        it "should return a positive number for moves that can result in a computer win" do
            board = [["O","",""],
                     ["O","",""],
                     ["","","X"]]
            expect(@comp_player.minimax(true, 0, board,@alpha,@beta)).to be > 0
        end
        it "should return a negative number for moves likely to result in the human player's win" do
            board = [["X","","X"],
                     ["", "",""],
                     ["X","","X"]]
            expect(@comp_player.minimax(true, 0, board,@alpha,@beta)).to be < 0
        end
        it "should return 0 for moves that'll result in a tie" do
            board = [["X","O","X"],
                     ["O","X","X"],
                     ["", "", "O"]]
            expect(@comp_player.minimax(true, 0, board,@alpha,@beta)).to eq(0)
        end
    end

    describe "#traverse_board_depth" do
        it "should return a positive number for moves that can result in a computer win" do
            board = [["O","",""],
                     ["O","",""],
                     ["","","X"]]
            expect(@comp_player.traverse_board_depth(-9999,0,board,"O",true,@alpha,@beta)).to be > 0
        end
        it "should return a negative number for moves likely to result in the human player's win" do
            board = [["X","","X"],
                     ["", "",""],
                     ["X","","X"]]
            expect(@comp_player.traverse_board_depth(9999,0,board,"X",false,@alpha,@beta)).to be < 0
        end
        it "should return 0 for moves that'll result in a tie" do
            board = [["O","X","O"],
                     ["X","O","O"],
                     ["", "", "X"]]
            expect(@comp_player.traverse_board_depth(9999,0,board,"X",false,@alpha,@beta)).to eq(0)
        end
    end

    describe "#find_best_move" do
        it "should update the computer's move to winning move when possible" do
            board = [["X","O",""],
                     ["X","", ""],
                     ["", "","O"]]
            @comp_player.find_best_move(board)
            expect(@comp_player.move).to eq([2,0])
        end
        it "should update computer's move to block human's move when possible" do
            board = [["X","O",""],
                     ["", "", "X"],
                     ["", "O",""]]
            @comp_player.find_best_move(board)
            expect(@comp_player.move).to eq([1,1])
        end
        it "should return a winning computer move on 4X4 board when possible" do
            g = Game.new(4)
            c_p = CompPlayer.new(g,"O","X")
            board = [["X","","","O"],
                     ["","","O",""],
                     ["","O","","X"],
                     ["","","",""]]
            c_p.find_best_move(board)
            expect(c_p.move).to eq([3,0])
        end
    end

end