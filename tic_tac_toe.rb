# require "set"

class Board
    attr_accessor :cells, :size

    def initialize(board_size)
        @size = board_size
        @cells = Array.new(board_size*board_size)
    end

    def display
        (0...@size).each do |row|
            row_start = row * @size
            row_end = row_start + @size -1 
            puts @cells[row_start..row_end].join("  |  ")
            puts "-"*20 if row!=@size-1
        end
    end

    def is_winner?(player)

        #check rows
        (0...@size).each do |row|
            return true if
            (row*@size...(row+1)*@size).all?{|i| @cells[i] == player.symbol}
        end

        #check columns
        (0...@size).each do |col|
            return true if
            (0...@size).all?{|row| @cells[@size*row+col] == player.symbol}                                                                      #each row
        end

        # Check main diagonal
        return true if (0...size).all? { |i| cells[i * (size + 1)] == player.symbol }

        # Check secondary diagonal
        return true if (0...size).all? { |i| cells[i * (size - 1) + (size - 1)] == player.symbol }

        false

    end

    def is_full?
        !(@cells.any?{|cell| cell.nil?})
    end
end

class Player
    attr_accessor :symbol
    def initialize(symbol)
        @symbol= symbol
    end

    def to_s
        symbol
    end

    def make_move(board, position)
        #implemen move logic
        if board.cells[position].nil? 
            board.cells[position] = @symbol
            puts "player #{@symbol} has made move."
        else
            puts "invalid move, place occupied"
        end
    end
end


class Game
    attr_accessor :board, :current_player

    def initialize(board_size)
        @board = Board.new(board_size)
        @current_player = Player.new("X")
    end

    def get_input
        puts "Enter board position(1,1)to(#{board.size},#{board.size}) separated by a comma(no space): "
        input = gets.strip
        numbers = input.split(',').map(&:to_i)

        array_index = (numbers[0]-1)*board.size+(numbers[1]-1)
        return array_index
    end

    def play_game
        while true
            board.display
            #input from current player and update it 
            
            puts "#{current_player}'s turn."
            
            position = get_input()
            current_player.make_move(board, position)

            #check winner
            if board.is_winner?(current_player)
                board.display
                puts "Player #{current_player.symbol} wins!"
                break
            elsif board.is_full?
                board.display
                puts "It's a tie."
                break
            end
            @current_player = @current_player.symbol == 'X' ? Player.new('O') : Player.new('X')
        end


    end

end


#getting the board size for game
def get_board_size
    puts "Enter the board size(3 to 9) which will of squre of given number"
    puts "e.g 3 for 3*3 and 9 for 9*9"
    board_size = gets.strip.to_i
end

board_size = get_board_size()

g = Game.new(board_size)
g.play_game
