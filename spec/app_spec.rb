require_relative "../lib/game_state_checker.rb"
require_relative "../lib/player.rb"
require_relative "../lib/comp_player.rb"
require_relative "../lib/board.rb"
require_relative "../lib/game_setup.rb"

RSpec.describe "Game loop" do
	context "Two unbeatable computer players playing against each other" do
		it "should result in a tie" do
			game_state = GameStateChecker.new
			board = Board.new(3)
			game_board = board.active_board
			x = "X"
			o = "O"
			playerX = CompPlayer.new(game_board,game_state,x,o)
			playerO = CompPlayer.new(game_board,game_state,o,x)

			while game_state.any_available_moves?(game_board)
				moveX = playerX.make_move
				board.update(x, moveX)
				break if game_state.outcome(x,o,game_board) != "active"
				moveO = playerO.make_move
				board.update(o, moveO)
				break if game_state.outcome(x,o,game_board) != "active"
			end

			expect(game_state.outcome(x,o,game_board)).to eq("Looks like a tie.\n\n")
		end
	end
	context "A computer player playing against a human player" do
		it "should win in cases where the human makes a mistake" do
			x = "X"
			o = "O"
			game_state = GameStateChecker.new
			board = Board.new(3)
			game_board = board.active_board
			playerO = CompPlayer.new(game_board,game_state,o,x)

			board.update(x,[2,1])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[1,2])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[1,0])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[0,0])
			move = playerO.make_move
			board.update(o,move)

			expect(game_state.outcome(x,o,game_board)).to eq("O is the winner!\n\n")
		end

		it "should tie in cases where the human starts in center and plays perfectly" do
			x = "X"
			o = "O"
			game_state = GameStateChecker.new
			board = Board.new(3)
			game_board = board.active_board
			playerO = CompPlayer.new(game_board,game_state,o,x)

			board.update(x,[1,1])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[2,0])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[0,1])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[1,2])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[2,2])

			expect(game_state.outcome(x,o,game_board)).to eq("Looks like a tie.\n\n")
		end
		it "should tie in cases where human starts in corner and plays perfectly" do
			x = "X"
			o = "O"
			game_state = GameStateChecker.new
			board = Board.new(3)
			game_board = board.active_board
			playerO = CompPlayer.new(game_board,game_state,o,x)

			board.update(x,[0,0])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[2,2])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[2,1])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[0,2])
			move = playerO.make_move
			board.update(o,move)
			board.update(x,[1,0])

			expect(game_state.outcome(x,o,game_board)).to eq("Looks like a tie.\n\n")
		end
	end
end