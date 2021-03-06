class TicTacToe
    attr_accessor :board
    attr_accessor :row
    attr_accessor :column
    attr_accessor :player
    attr_accessor :turn_count

    def initialize()
        @board = [["-","-","-"],["-","-","-"],["-","-","-"]]
        @turn_count = 0
    end

    def print_board
        print " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} \n-----------\n #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} \n-----------\n #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} \n"
    end

    def ask_player_move
        puts "What row do you want to place your marker in?"
        @row = gets.chomp.to_i
        puts "and your column?"
        @column = gets.chomp.to_i
    end

    def row_and_column_exist(row, column)
        ((1 <= row) && (row <= 3)) && ((1 <= column) && (column <= 3))
    end

    def cell_is_available(row, column)
        @board[(row-1)][(column-1)] == '-'
    end

    def determine_player_symbol(turn_count)
        if turn_count % 2 == 0
            @player = "X"
        else
            @player = "O"
        end
    end

    def execute_move(row, column, player)
        @board[(row-1)][(column-1)] = player
        @turn_count +=1
    end

    def player_won(player)
        winning_combinations = [
            # horizontal
            ((@board[0][0] == player) && (@board[0][1] == player) && (@board[0][2] == player)),
            ((@board[1][0] == player) && (@board[1][1] == player) && (@board[1][2] == player)),
            ((@board[2][0] == player) && (@board[2][1] == player) && (@board[2][2] == player)),
            # verticle
            ((@board[0][0] == player) && (@board[1][0] == player) && (@board[2][0] == player)),
            ((@board[0][1] == player) && (@board[1][1] == player) && (@board[2][1] == player)),
            ((@board[0][2] == player) && (@board[1][2] == player) && (@board[2][2] == player)),
            # diagonal
            ((@board[0][0] == player) && (@board[1][1] == player) && (@board[2][2] == player)),
            ((@board[0][2] == player) && (@board[1][1] == player) && (@board[2][0] == player)),
        ]
        winning_combinations.include? true
    end

    def board_full
        @board.each do |row|
            row.each do |cell|
                if cell == "-"
                    return false
                end
            end
        end
        return true
    end
end