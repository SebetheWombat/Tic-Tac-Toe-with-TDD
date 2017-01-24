require_relative "../lib/player.rb"
require_relative "../lib/comp_player.rb"
require_relative "../lib/game.rb"

RSpec.describe CompPlayer do
	before(:each) do
		game = Game.new
		@comp_player = CompPlayer.new(game)
	end

	describe "#minimax" do
		it "should return a positive number for moves that can result in a computer win" do
			board = [["X","",""],
					 ["X","",""],
					 ["","","O"]]
			expect(@comp_player.minimax(true, 0, board)).to be > 0
		end
		it "should return a negative number for moves likely to result in the human player's win" do
			board = [["O","","O"],
					 ["", "",""],
					 ["O","","O"]]
			expect(@comp_player.minimax(true, 0, board)).to be < 0
		end
		it "should return 0 for moves that'll result in a tie" do
			board = [["O","X","O"],
					 ["X","O","O"],
					 ["", "", "X"]]
			expect(@comp_player.minimax(true, 0, board)).to eq(0)
		end
	end

	describe "#traverse_board_depth" do
		it "should return a positive number for moves that can result in a computer win" do
			board = [["X","",""],
					 ["X","",""],
					 ["","","O"]]
			expect(@comp_player.traverse_board_depth(-9999,0,board,"X",true)).to be > 0
		end
		it "should return a negative number for moves likely to result in the human player's win" do
			board = [["O","","O"],
					 ["", "",""],
					 ["O","","O"]]
			expect(@comp_player.traverse_board_depth(9999,0,board,"O",false)).to be < 0
		end
		it "should return 0 for moves that'll result in a tie" do
			board = [["O","X","O"],
					 ["X","O","O"],
					 ["", "", "X"]]
			expect(@comp_player.traverse_board_depth(-9999,0,board,"X",true)).to eq(0)
		end
	end

	describe "#find_best_move" do
		it "should update the computer's move to winning move when possible" do
			board = [["X","O",""],
					 ["X","", ""],
					 ["", "","O"]]
			@comp_player.find_best_move(board)
			expect(@comp_player.move).to eq([2,0])
		end
		it "should update computer's move to block human's move when possible" do
			board = [["X","O",""],
					 ["", "", "X"],
					 ["", "O",""]]
			@comp_player.find_best_move(board)
			expect(@comp_player.move).to eq([1,1])
		end
	end

end