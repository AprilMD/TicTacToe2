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
            expect(game.row).not_to eql(nil)
        end
        it 'changes the variable column to the given column' do
            game = TicTacToe.new
            game.ask_player_move
            expect(game.column).not_to eql(nil)
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

    describe 'player (X or Y) is determined based on player turn' do
        it 'makes player_symbol "O" when turn count is odd' do
            game = TicTacToe.new
            game.determine_player_symbol(1)
            expect(game.player).to eql("O")
        end
        it 'makes player_symbol "X" when turn count is even' do
            game = TicTacToe.new
            game.determine_player_symbol(2)
            expect(game.player).to eql("X")
        end
    end

    describe 'player turn' do
        it 'places player symbol into the given cell' do
            game = TicTacToe.new
            game.execute_move(1, 1, "X")
            expect(game.board[0][0]).to eql("X")
        end
        it 'places player symbol into the given cell' do
            game = TicTacToe.new
            game.execute_move(2, 3, "O")
            expect(game.board[1][2]).to eql("O")
        end
        it 'increments the turn count' do
            game = TicTacToe.new
            game.execute_move(2, 3, "O")
            game.execute_move(1, 1, "X")
            expect(game.turn_count).to eql(2)
        end
    end
    describe 'check for any winning combinations' do
        it 'returns true if there is a winning horizontal combination for the first row' do
            game = TicTacToe.new
            game.board = [["X","X","X"],["-","-","-"],["-","-","-"]]
            expect(game.player_won("X")).to eq(true)
        end
        it 'returns true if there is a winning horizontal combination for the third row' do
            game = TicTacToe.new
            game.board = [["-","-","-"],["-","-","-"],["O","O","O"]]
            expect(game.player_won("O")).to eq(true)
        end
        it 'returns true if there is a winning verticle combination for the second column' do
            game = TicTacToe.new
            game.board = [["-","X","-"],["-","X","-"],["-","X","-"]]
            expect(game.player_won("X")).to eq(true)
        end
        it 'returns true if there is a winning diagonal combination' do
            game = TicTacToe.new
            game.board = [["O","-","-"],["-","O","-"],["-","-","O"]]
            expect(game.player_won("O")).to eq(true)
        end
        it 'returns false if there is no winning combination' do
            game = TicTacToe.new
            game.board = [["O","-","X"],["-","O","X"],["O","X","-"]]
            expect(game.player_won("O")).to eq(false)
        end
    end

    describe 'checks if board is full' do
        it 'returns true if board full' do
            game = TicTacToe.new
            game.board = [["O","X","X"],["X","O","X"],["O","X","O"]]
            expect(game.board_full).to eq(true)
        end
        it 'returns false if board is not full' do
            game = TicTacToe.new
            game.board = [["O","X","X"],["X","-","X"],["O","X","O"]]
            expect(game.board_full).to eq(true)
        end
    end

    describe 'prints board' do
        it 'prints the board to the terminal in a readable format' do
            game = TicTacToe.new
            board_view = " - | - | - \n-----------\n - | - | - \n-----------\n - | - | - "
            expect{ game.print_board }.to output(board_view).to_stdout
        end
    end
        

   
