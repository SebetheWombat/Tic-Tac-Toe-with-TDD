#TODO: test user input

require "stringio"
require_relative "../lib/player.rb"
require_relative "../lib/game.rb"

RSpec.describe Player do
	before(:each) do
		game = Game.new
		@player = Player.new(game)
	end
	describe "#initialize" do
		it "should initiate the board the player is playing on" do
			expect(@player.board).to eq([["","",""],["","",""],["","",""]])
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
		it "should take in user input and update the move variable" do

		end

	end

end