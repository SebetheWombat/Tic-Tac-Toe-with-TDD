require "stringio"
require_relative "../lib/player.rb"
require_relative "../lib/board.rb"

RSpec.describe Player do
    before(:each) do
        board = Board.new(3)
        game_board = board.active_board
        @player = Player.new(game_board)
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