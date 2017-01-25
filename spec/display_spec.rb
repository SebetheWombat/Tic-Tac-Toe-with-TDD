require_relative("../lib/display.rb")
RSpec.describe Display do
    before(:each) do
        @display = Display.new
    end
	describe "#draw_board" do
		it "draws an empty board at the start of the game if no number was specified" do
			board = [["","",""],
                     ["","",""],
                     ["","",""]]
            expect { @display.draw_board(board) }.to output("3 |    |   |  \n  | ---+---+---\n2 |    |   |  \n  | ---+---+---\n1 |    |   |  \n  |____________\n     a | b | c \n\n").to_stdout
		end
		it "draws an empty 4X4 board at start of game if size 4 was specified" do
			board = [["","","",""],
                     ["","","",""],
                     ["","","",""],
                     ["","","",""]]
			expect { @display.draw_board(board) }.to output("4 |    |   |   |  \n  | ---+---+---+---\n3 |    |   |   |  \n  | ---+---+---+---\n2 |    |   |   |  \n  | ---+---+---+---\n1 |    |   |   |  \n  |________________\n     a | b | c | d \n\n").to_stdout

		end
		it "draws 'X' and 'O' on board in appropriate spots during game" do
			board = [["O","",""],["","X",""],["","O","X"]]
			expect { @display.draw_board(board) }.to output("3 |  O |   |  \n  | ---+---+---\n2 |    | X |  \n  | ---+---+---\n1 |    | O | X\n  |____________\n     a | b | c \n\n").to_stdout
	
		end
	end
end