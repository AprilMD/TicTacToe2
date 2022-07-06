class TicTacToe
    attr_accessor :board
    attr_accessor :row
    attr_accessor :column
    def initialize()
        @board = [["-","-","-"],["-","-","-"],["-","-","-"]]
        @row = 0
        @column = 0
    end

    def ask_player_move
        puts "What row do you want to place your marker in?"
        @row = gets.chomp.to_i
        puts "and your column?"
        @column = gets.chomp.to_i
        return @row, @column
    end
end