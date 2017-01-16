require_relative "../lib/game.rb"

RSpec.describe Game do
	before(:each) do
		@game = Game.new
	end
	describe "#initialize" do		
		it "should create an empty 3X3 matrix" do
			expect(@game.board).to eq([["","",""],["","",""],["","",""]])
		end
	end

	describe "#any_available_moves?" do
		it "should return a boolean value" do
			expect([true,false]).to include(@game.any_available_moves?)
		end
		it "should return true if there are any open spaces on the board" do
			expect(@game.any_available_moves?).to be_truthy

			@game.board = [["X","O","X"],["O","X","O"], ["","O","X"]]
			expect(@game.any_available_moves?).to be_truthy

			@game.board = [["X","",""],["O","","O"], ["","O","X"]]
			expect(@game.any_available_moves?).to be_truthy
		end
		it "should return false if all spaces are occupied" do
			@game.board = [["X","O","X"],["O","X","O"], ["X","O","X"]]
			expect(@game.any_available_moves?).to be_falsey
		end
	end

	describe "#update_board" do
		it "should add player's move to board" do
			@game.update_board("X",[0,0])
			expect(@game.board).to eq([["X","",""],["","",""],["","",""]])

			@game.update_board("O",[2,2])
			expect(@game.board).to eq([["X","",""],["","",""],["","","O"]])

			@game.update_board("X",[1,1])
			expect(@game.board).to eq([["X","",""],["","X",""],["","","O"]])
		end
		it "should add an 'X' or 'O' in the appropriate location for the appropriate player" do
			@game.update_board("O",[0,1])
			expect(@game.board).to eq([["","O",""],["","",""],["","",""]])
			expect(@game.board).not_to eq([["","X",""],["","",""],["","",""]])
		end
	end

	describe "#check_for_winner" do
		it "should return 10 if computer completed a row, column or diagonal" do
			@game.board = [["X","X","X"],["","",""],["","",""]]
			expect(@game.check_for_winner).to eq(10)

			 @game.board = [["X","O","O"],["X","X","X"],["","O",""]]
			 expect(@game.check_for_winner).to eq(10)

			@game.board = [["","X",""],["","X",""],["","X",""]]
			expect(@game.check_for_winner).to eq(10)

			@game.board = [["X","",""],["","X",""],["","","X"]]
			expect(@game.check_for_winner).to eq(10)

			@game.board = [["","","X"],["","X",""],["X","",""]]
			expect(@game.check_for_winner).to eq(10)			
		end
		it "should return -10 if human player completed a row, column or diagonal" do
			@game.board = [["O","O","O"],["X","","X"],["","O","X"]]
			expect(@game.check_for_winner).to eq(-10)

			@game.board = [["","","O"],["","O",""],["O","",""]]
			expect(@game.check_for_winner).to eq(-10)

			@game.board = [["","X","O"],["","","O"],["","X","O"]]
			expect(@game.check_for_winner).to eq(-10)

			@game.board = [["O","",""],["","O",""],["","","O"]]
			expect(@game.check_for_winner).to eq(-10)
		end
		it "should return 0 if there are no completed rows, columns, or diagonals" do
			@game.board = [["","","O"],["","","X"],["O","",""]]
			expect(@game.check_for_winner).to eq(0)
		end
		it "should return 0 if completed row, column, or diagonal is occupied by both players" do
			@game.board = [["O","X","O"],["X","","X"],["","O","X"]]
			expect(@game.check_for_winner).to eq(0)

			@game.board = [["","","O"],["","X",""],["O","",""]]
			expect(@game.check_for_winner).to eq(0)

			@game.board = [["","X","O"],["","","X"],["","X","O"]]
			expect(@game.check_for_winner).to eq(0)

			@game.board = [["O","",""],["","X",""],["","","X"]]
			expect(@game.check_for_winner).to eq(0)
		end
	end
end