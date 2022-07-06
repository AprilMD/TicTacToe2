require_relative '../tictactoe.rb'

describe 'tictactoe game'
    describe 'tictactoe board' do
        it 'shows a 3x3 grid' do
            game = TicTacToe.new
            expect(game.board).to eq([['-','-','-'],['-','-','-'],['-','-','-']])
        end
    end

    describe 'ask player for their input for desired move' do
        it 'changes the variable row to the given row' do
            game = TicTacToe.new
            game.ask_player_move
            expect(game.row).not_to eql(0)
        end
        it 'changes the variable column to the given column' do
            game = TicTacToe.new
            game.ask_player_move
            expect(game.column).not_to eql(0)
        end
    end

    describe 'check input validity' do
        describe 'check row and column inputs are valid for board' do 
            it 'returns true if row and column numbers are between 1 and 3' do
                game = TicTacToe.new
                expect(game.row_and_column_exist(2,2)).to eql(true)
            end

            it 'returns false is row is 0 or fewer' do
                game = TicTacToe.new
                expect(game.row_and_column_exist(0,2)).to eql(false)
            end

            it 'returns false is column is 0 or fewer' do
                game = TicTacToe.new
                expect(game.row_and_column_exist(2,0)).to eql(false)
            end

            it 'returns false is row is 4 or higher' do
                game = TicTacToe.new
                expect(game.row_and_column_exist(12,3)).to eql(false)
            end

            it 'returns false is column is 4 or higher' do
                game = TicTacToe.new
                expect(game.row_and_column_exist(1,9)).to eql(false)
            end
        end
        describe 'it checks that the cell is available' do
            it 'returns true if the cell is available' do
                game = TicTacToe.new
                expect(game.cell_is_available(1,1)).to eql(true)
            end
            it 'returns false if the cell is already occupied' do
                game = TicTacToe.new
                game.board[1][1] = "X"
                expect(game.cell_is_available(2,2)).to eql(false)
            end
        end
    end
