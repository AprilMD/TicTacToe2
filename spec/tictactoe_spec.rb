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
