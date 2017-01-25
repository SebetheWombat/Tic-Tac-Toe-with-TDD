require_relative "../lib/game.rb"

RSpec.describe Game do
	before(:each) do
		@game = Game.new
	end
	describe "#initialize" do		
		it "should create an empty 3X3 matrix" do
			expect(@game.board).to eq( [["","",""],
										["","",""],
										["","",""]])
		end
	end

	describe "#any_available_moves?" do
		it "should return true if there are any open spaces on the board" do
			expect(@game.any_available_moves?).to eq(true)

			@game.board = [ ["X","O","X"],
							["O","X","O"],
							["","O","X"]]
			expect(@game.any_available_moves?).to eq(true)

			@game.board = [ ["X","",""],
							["O","","O"],
							["","O","X"]]
			expect(@game.any_available_moves?).to eq(true)
		end
		it "should return false if all spaces are occupied" do
			@game.board = [ ["X","O","X"],
							["O","X","O"],
							["X","O","X"]]
			expect(@game.any_available_moves?).to eq(false)
		end
	end

	describe "#update_board" do
		it "should add player's move to board" do
			@game.update_board("X",[0,0])
			expect(@game.board).to eq([["X","",""],
										["","",""],
										["","",""]])

			@game.update_board("O",[2,2])
			expect(@game.board).to eq([["X","",""],
										["","",""],
										["","","O"]])

			@game.update_board("X",[1,1])
			expect(@game.board).to eq([ ["X","",""],
										["","X",""],
										["","","O"]])
		end
		it "should add an 'X' or 'O' in the appropriate location for the appropriate player" do
			@game.update_board("O",[0,1])
			expect(@game.board).to eq([ ["","O",""],
										["","",""],
										["","",""]])
			expect(@game.board).not_to eq([["","X",""],
											["","",""],
											["","",""]])
		end
	end

	describe "#test_winning_moves" do
		it "should return 10 if computer(O) completed a row or column" do
			@game.board = [ ["O","O","O"],
							["X","","X"],
							["","O","X"]]
			expect(@game.test_winning_moves("X","O")).to eq(10)

			@game.board = [ ["","X","O"],
							["","","O"],
							["","X","O"]]
			expect(@game.test_winning_moves("X","O")).to eq(10)
		end
		it "should return 10 for diagonal computer wins" do
			@game.board = [ ["","","O"],
							["","O",""],
							["O","",""]]
			expect(@game.test_winning_moves("X","O")).to eq(10)

			@game.board = [ ["O","",""],
							["","O",""],
							["","","O"]]
			expect(@game.test_winning_moves("X","O")).to eq(10)
		end
		it "should return -10 if human(X) player completed a row or column" do
			@game.board = [["X","X","X"],
							["","",""],
							["","",""]]
			expect(@game.test_winning_moves("X","O")).to eq(-10)

			 @game.board = [["X","O","O"],
			 				["X","X","X"],
			 				["","O",""]]
			 expect(@game.test_winning_moves("X","O")).to eq(-10)

			@game.board = [ ["","X",""],
							["","X",""],
							["","X",""]]
			expect(@game.test_winning_moves("X","O")).to eq(-10)
		end
		it "should return -10 for diagonal human wins" do
			@game.board = [ ["X","",""],
							["","X",""],
							["","","X"]]
			expect(@game.test_winning_moves("X","O")).to eq(-10)

			@game.board = [ ["","","X"],
							["","X",""],
							["X","",""]]
			expect(@game.test_winning_moves("X","O")).to eq(-10)
		end
		it "should return 0 if there are no completed rows, columns, or diagonals" do
			@game.board = [ ["","","O"],
							["","","X"],
							["O","",""]]
			expect(@game.test_winning_moves("X","O")).to eq(0)
		end
		it "should return 0 if completed row, column, or diagonal is occupied by both players" do
			@game.board = [ ["O","X","O"],
							["X","","X"],
							["","O","X"]]
			expect(@game.test_winning_moves("X","O")).to eq(0)

			@game.board = [ ["","","O"],
							["","X",""],
							["O","",""]]
			expect(@game.test_winning_moves("X","O")).to eq(0)

			@game.board = [ ["","X","O"],
							["","","X"],
							["","X","O"]]
			expect(@game.test_winning_moves("X","O")).to eq(0)

			@game.board = [ ["O","",""],
							["","X",""],
							["","","X"]]
			expect(@game.test_winning_moves("X","O")).to eq(0)
		end
		it "should return correct numbers for winning moves on 4x4 board" do
			g = Game.new(4)
			g.board = [ ["X","","","O"],
						["","X","O",""],
						["","O","",""],
						["O","","",""]]
			expect(g.test_winning_moves("X","O")).to eq(10)

		end
	end
    describe "#active_game_state?" do
        it "should return false if there are no available moves" do
            @game.board = [["X","O","X"],
                           ["X","O","O"],
                           ["O","X","X"]]
            expect(@game.active_game_state?).to eq(false)
        end
        it "should return false if computer has won" do
            @game.board = [["O","O","O"],
                           ["","X",""],
                           ["O","X","X"]]
            expect(@game.active_game_state?).to eq(false)
        end
        it "should return false if human has won" do
            @game.board = [["X","O","O"],
                           ["","X",""],
                           ["O","","X"]]
            expect(@game.active_game_state?).to eq(false)
        end
        it "should return true if there are still empty space on board and neither player has won" do
            @game.board = [["X","O",""],
                           ["X","","O"],
                           ["","O","X"]]
            expect(@game.active_game_state?).to eq(true)
        end
    end
	describe "#draw_board" do
		it "draws an empty board at the start of the game if no number was specified" do
			expect { @game.draw_board }.to output("3 |    |   |  \n  | ---+---+---\n2 |    |   |  \n  | ---+---+---\n1 |    |   |  \n  |____________\n     a | b | c \n\n").to_stdout
		end
		it "draws an empty 4X4 board at start of game if size 4 was specified" do
			game_four = Game.new(4)
			expect { game_four.draw_board }.to output("4 |    |   |   |  \n  | ---+---+---+---\n3 |    |   |   |  \n  | ---+---+---+---\n2 |    |   |   |  \n  | ---+---+---+---\n1 |    |   |   |  \n  |________________\n     a | b | c | d \n\n").to_stdout

		end
		it "draws 'X' and 'O' on board in appropriate spots during game" do
			@game.board = [["O","",""],["","X",""],["","O","X"]]
			expect { @game.draw_board }.to output("3 |  O |   |  \n  | ---+---+---\n2 |    | X |  \n  | ---+---+---\n1 |    | O | X\n  |____________\n     a | b | c \n\n").to_stdout
	
		end
	end


end