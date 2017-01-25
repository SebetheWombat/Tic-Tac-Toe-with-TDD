require "stringio"
require_relative "../lib/player.rb"
require_relative "../lib/game.rb"

RSpec.describe Player do
    before(:each) do
        game = Game.new
        @player = Player.new(game,"X","O")
    end
    describe "#initialize" do
        it "should initiate the board the player is playing on" do
            expect(@player.board).to eq([["","",""],
                                         ["","",""],
                                         ["","",""]])
        end
    end

    describe "is_move_valid?" do
        it "should return a true or false value" do
            @player.move = [0,0]
            expect([true,false]).to include(@player.is_move_valid?)
        end
        it "should return false for moves to occupied spaces" do
            @player.board[0][0] = "X"
            @player.move = [0,0]
            expect(@player.is_move_valid?).to be_falsey
        end

        it "should return false for moves off of board" do
            @player.move = [4,5]
            expect(@player.is_move_valid?).to be_falsey
        end

        it "should return true for valid moves" do
            @player.move = [0,2]
            expect(@player.is_move_valid?).to be_truthy
        end
    end

    describe "make_move" do
        it "should take in user input and update the move variable accordingly" do
            allow(@player).to receive(:gets).and_return("a3")
            @player.make_move
            expect(@player.move).to eq([0,0])

            allow(@player).to receive(:gets).and_return("c1")
            @player.make_move
            expect(@player.move).to eq([2,2])
        end
        it "is case insensitive" do
            allow(@player).to receive(:gets).and_return("B2")
            @player.make_move
            expect(@player.move).to eq([1,1])
        end
        it "should change move to [-1,-1] if user inputs too many or too few possible moves" do
            allow(@player).to receive(:gets).and_return("a1234")
            @player.make_move
            expect(@player.move).to eq([-1,-1])

            allow(@player).to receive(:gets).and_return("a")
            @player.make_move
            expect(@player.move).to eq([-1,-1])
        end
        it "should ignore spaces in user input" do
            allow(@player).to receive(:gets).and_return("b 2")
            @player.make_move
            expect(@player.move).to eq([1,1])

            allow(@player).to receive(:gets).and_return("c        3")
            @player.make_move
            expect(@player.move).to eq([0,2])
        end

    end

end