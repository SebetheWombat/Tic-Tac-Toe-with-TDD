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
			expect(@setup.get_number_from_user).to eq(1)
		end
	end

	describe "#number_players_valid?" do
		it "should return true for 1 or 2 players" do
			expect(@setup.number_players_valid?(1)).to eq(true)

			expect(@setup.number_players_valid?(2)).to eq(true)
		end

		it "should return false for anything other then 1 or 2 players" do
			expect(@setup.number_players_valid?(4)).to eq(false)
			expect(@setup.number_players_valid?(-2)).to eq(false)
			expect(@setup.number_players_valid?("cats")).to eq(false)
		end
	end

	describe "#board_size_valid?" do
		it "should return true for numbers between 3 and 5 inclusive" do
			expect(@setup.board_size_valid?(3)).to eq(true)
			expect(@setup.board_size_valid?(4)).to eq(true)
			expect(@setup.board_size_valid?(5)).to eq(true)
		end

		it "should return false for any values not between 3 and 5 inclusive" do
			expect(@setup.board_size_valid?(1)).to eq(false)
			expect(@setup.board_size_valid?(-2)).to eq(false)
			expect(@setup.board_size_valid?("hotdogs")).to eq(false)
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