require_relative "../lib/player.rb"
require_relative "../lib/game.rb"

RSpec.describe Game do
    before(:each) do
        @game = Game.new
        board = [["","",""],
                 ["","",""],
                 ["","",""]]
        @player = Player.new(board)
    end
    describe "#player_makes_move" do
        it "should return a valid move" do
            allow(@player).to receive(:gets).and_return("b2")
            expect(@game.player_makes_move(@player)).to eq([1,1])
        end
    end
end