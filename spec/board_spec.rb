require_relative "../lib/board.rb"

RSpec.describe Board do
    before(:each) do
        @board = Board.new
    end
    describe "#initialize" do       
        it "should create an empty 3X3 matrix if no argument is given" do
            expect(@board.board).to eq( [["","",""],
                                        ["","",""],
                                        ["","",""]])
        end

        it "should create a 4X4 matrix if given 4 as an argument" do
            four_board = Board.new(4)
            expect(four_board.board).to eq([["","","",""],
                                        ["","","",""],
                                        ["","","",""],
                                        ["","","",""]])
        end
    end

    describe "#update" do
        it "should add player's move to board" do
            @board.update("X",[0,0])
            expect(@board.board).to eq([["X","",""],
                                        ["","",""],
                                        ["","",""]])

            @board.update("O",[2,2])
            expect(@board.board).to eq([["X","",""],
                                        ["","",""],
                                        ["","","O"]])

            @board.update("X",[1,1])
            expect(@board.board).to eq([ ["X","",""],
                                        ["","X",""],
                                        ["","","O"]])
        end
        it "should add an 'X' or 'O' in the appropriate location for the appropriate player" do
            @board.update("O",[0,1])
            expect(@board.board).to eq([ ["","O",""],
                                        ["","",""],
                                        ["","",""]])
            
            expect(@board.board).not_to eq([["","X",""],
                                            ["","",""],
                                            ["","",""]])
        end
    end
end