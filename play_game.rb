require_relative './tictactoe.rb'

def play_game
    game = TicTacToe.new
    puts "Welcome to TicTacToe 👋"
    game.print_board
    puts "The player to take the first turn will be player 1 and assigned the 'X' symbol"

    game.ask_player_move
    if game.row_and_column_exist(game.row, game.column)
        if game.cell_is_available(game.row, game.column)
            game.determine_player_symbol(game.turn_count)
            game.execute_move(game.row, game.column, game.player)
            game.print_board
            if game.player_won(game.player)
                puts "Congratulations - #{game.player} wins!"
            elsif game.board_full
                puts "Uh-oh, that's a tie."
            else
                puts "hey"
                game.ask_player_move
            end
        else
            puts "cell is already occupied"
            game.print_board
            puts "please choose a cell that is available, marked with a '-'"
            ask_player_move
        end
    else
        puts "invalid coordinates entered; please enter a row and column between 1 and 3."
        game.ask_player_move
    end
end

play_game