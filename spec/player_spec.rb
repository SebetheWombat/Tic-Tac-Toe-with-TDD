require "stringio"
require_relative "../lib/player.rb"
require_relative "../lib/board.rb"

RSpec.describe Player do
    before(:each) do
        board = Board.new(3)
        game_board = board.active_board
        @player = Player.new(game_board)
    end
    describe "#initialize" do
        it "should initiate the board the player is playing on" do
            expect(@player.board).to eq([["","",""],
                                         ["","",""],
                                         ["","",""]])
        end
    end

    describe "is_move_valid?" do
        it "should return false for moves to occupied spaces" do
            @player.board[0][0] = "X"
            expect(@player.send(:is_move_valid?, [0,0])).to eq(false)
        end

        it "should return false for moves off of board" do
            expect(@player.send(:is_move_valid?,[4,5])).to eq(false)
        end

        it "should return true for valid moves" do
            expect(@player.send(:is_move_valid?,[0,2])).to eq(true)
        end
    end

     describe "make_move" do
         it "should take in user input and update the move variable accordingly" do
             allow(@player).to receive(:gets).and_return("a3")
             @player.make_move
             expect(@player.make_move).to eq([0,0])

             allow(@player).to receive(:gets).and_return("c1")
             expect(@player.make_move).to eq([2,2])
         end
         it "is case insensitive" do
             allow(@player).to receive(:gets).and_return("B2")
             expect(@player.make_move).to eq([1,1])
         end

         it "should ignore spaces in user input" do
             allow(@player).to receive(:gets).and_return("b 2")
             expect(@player.make_move).to eq([1,1])

             allow(@player).to receive(:gets).and_return("c        3")
             expect(@player.make_move).to eq([0,2])
         end

     end

end