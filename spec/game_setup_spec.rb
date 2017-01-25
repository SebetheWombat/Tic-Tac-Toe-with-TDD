require_relative "../lib/game_setup.rb"
require_relative "../lib/player.rb"
require_relative "../lib/comp_player.rb"
require_relative "../lib/game.rb"

RSpec.describe GameSetup do
	before(:each) do
		@setup = GameSetup.new
	end
	describe "#determine_players" do
		it "should receive user input and convert it to an integer" do
			allow(@setup).to receive(:gets).and_return("1")
			expect(@setup.determine_players).to eq(1)
		end
	end

	describe "#valid?" do
		it "should return true for 1 or 2 players" do
			expect(@setup.valid?(1)).to eq(true)

			expect(@setup.valid?(2)).to eq(true)
		end

		it "should return false for anything other then 1 or 2 players" do
			expect(@setup.valid?(4)).to eq(false)
			expect(@setup.valid?(-2)).to eq(false)
			expect(@setup.valid?("cats")).to eq(false)
		end
	end

	describe "#set_player_two" do
        it "should return a new computer player for 1 player" do
    		board = [["","",""],
                     ["","",""],
                     ["","",""]]
            game = Game.new
            expect(@setup.set_player_two(1,board,game,"O","X")).to be_a(CompPlayer)
        end
        it "should return a human player if not a 1 player game" do
            board = [["","",""],
                     ["","",""],
                     ["","",""]]
            game = Game.new
            expect(@setup.set_player_two(2,board,game,"O","X")).to be_a(Player)
            expect(@setup.set_player_two(2,board,game,"O","X")).to_not be_a(CompPlayer)
        end
	end
end