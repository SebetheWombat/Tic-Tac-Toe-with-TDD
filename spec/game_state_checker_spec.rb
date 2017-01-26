require_relative "../lib/game_state_checker.rb"

RSpec.describe GameStateChecker do
	before(:each) do
		@game = GameStateChecker.new
	end
	
	describe "#any_available_moves?" do
		it "should return true if there are any open spaces on the board" do

			board = [["X","O","X"],
					 ["O","X","O"],
					 ["","O","X"]]
			expect(@game.any_available_moves?(board)).to eq(true)

			board = [["X","",""],
					 ["O","","O"],
					 ["","O","X"]]
			expect(@game.any_available_moves?(board)).to eq(true)
		end
		it "should return false if all spaces are occupied" do
			board = [["X","O","X"],
					 ["O","X","O"],
					 ["X","O","X"]]
			expect(@game.any_available_moves?(board)).to eq(false)
		end
	end

	describe "#test_winning_moves" do
		it "should return 10 if computer(O) completed a row or column" do
			board = [ ["O","O","O"],
					  ["X","","X"],
					  ["","O","X"]]
			expect(@game.test_winning_moves("X","O",board)).to eq(10)

			board = [ ["","X","O"],
					  ["","","O"],
					  ["","X","O"]]
			expect(@game.test_winning_moves("X","O",board)).to eq(10)
		end
		it "should return 10 for diagonal computer wins" do
			board = [ ["","","O"],
					  ["","O",""],
					  ["O","",""]]
			expect(@game.test_winning_moves("X","O",board)).to eq(10)

			board = [ ["O","",""],
					  ["","O",""],
					  ["","","O"]]
			expect(@game.test_winning_moves("X","O",board)).to eq(10)
		end
		it "should return -10 if human(X) player completed a row or column" do
			board = [["X","X","X"],
					  ["","",""],
					  ["","",""]]
			expect(@game.test_winning_moves("X","O",board)).to eq(-10)

			 board = [["X","O","O"],
			 		  ["X","X","X"],
			 		  ["","O",""]]
			 expect(@game.test_winning_moves("X","O",board)).to eq(-10)

			board = [ ["","X",""],
					  ["","X",""],
					  ["","X",""]]
			expect(@game.test_winning_moves("X","O",board)).to eq(-10)
		end
		it "should return -10 for diagonal human wins" do
			board = [ ["X","",""],
					  ["","X",""],
					  ["","","X"]]
			expect(@game.test_winning_moves("X","O",board)).to eq(-10)

			board = [ ["","","X"],
					  ["","X",""],
					  ["X","",""]]
			expect(@game.test_winning_moves("X","O",board)).to eq(-10)
		end
		it "should return 0 if there are no completed rows, columns, or diagonals" do
			board = [ ["","","O"],
					  ["","","X"],
					  ["O","",""]]
			expect(@game.test_winning_moves("X","O",board)).to eq(0)
		end
		it "should return 0 if completed row, column, or diagonal is occupied by both players" do
			board = [ ["O","X","O"],
					  ["X","","X"],
					  ["","O","X"]]
			expect(@game.test_winning_moves("X","O",board)).to eq(0)

			board = [ ["","","O"],
					  ["","X",""],
					  ["O","",""]]
			expect(@game.test_winning_moves("X","O",board)).to eq(0)

			board = [ ["","X","O"],
					  ["","","X"],
					  ["","X","O"]]
			expect(@game.test_winning_moves("X","O",board)).to eq(0)

			board = [ ["O","",""],
					  ["","X",""],
					  ["","","X"]]
			expect(@game.test_winning_moves("X","O",board)).to eq(0)
		end
		it "should return correct numbers for winning moves on 4x4 board" do
			board = [ ["X","","","O"],
						["","X","O",""],
						["","O","",""],
						["O","","",""]]
			expect(@game.test_winning_moves("X","O",board)).to eq(10)

		end
	end
	describe "#outcome" do
        it "should return appropriate message if there are no available moves" do
            board = [["X","O","X"],
                     ["X","O","O"],
                     ["O","X","X"]]
            expect(@game.outcome("X","O",board)).to eq("Looks like a tie.\n\n")
        end
        it "should return appropriate message if computer has won" do
            board = [["O","O","O"],
                     ["","X",""],
                     ["O","X","X"]]
            expect(@game.outcome("X","O",board)).to eq("Computer Victory!\n\n")
        end
        it "should return appropriate message if human has won" do
            board = [["X","O","O"],
                     ["","X",""],
                     ["O","","X"]]
            expect(@game.outcome("X","O",board)).to eq("Human Victory!\n\n")
        end
        it "should return 'active' if there are still empty space on board and neither player has won" do
            board = [["X","O",""],
                     ["X","","O"],
                     ["","O","X"]]
            expect(@game.outcome("X","O",board)).to eq("active")
        end
    end

end