class Board
    attr_accessor :board

    def initialize
        @board = Array.new(9)
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def is_winner?(player)
        win_condition = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
        ]

        win_condition.any? do |condition|
            @board[condition[0]] == player.symbol && @board[condition[1]] == player.symbol && @board[condition[2]] == player.symbol
        end
    end

    def is_full?(board)
        !(board.board.any?{|cell| cell.nil?})
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
        if board.board[position].nil? 
            board.board[position] = @symbol
            puts "player #{@symbol} has made move."
        else
            puts "invalid move, place occupied"
        end
    end
end


class Game
    attr_accessor :board, :current_player

    def initialize
        @board = Board.new
        @current_player = Player.new("X")
    end

    def get_input
        puts "Enter board position(1,1)to(3,3) separated by a comma(no space): "
        input = gets.strip
        numbers = input.split(',').map(&:to_i)

        array_index = (numbers[0]-1)*3+(numbers[1]-1)
        return array_index
    end

    def play_game
        while true
            board.display_board
            #input from current player and update it 
            
            puts "#{current_player}'s turn."
            
            position = get_input()
            current_player.make_move(board, position)

            #check winner
            if board.is_winner?(current_player)
                board.display_board
                puts "Player #{current_player.symbol} wins!"
                break
            elsif board.is_full?(@board)
                board.display_board
                puts "It's a tie."
                break
            end
            @current_player = @current_player.symbol == 'X' ? Player.new('O') : Player.new('X')
        end


    end

end


g = Game.new
g.play_game
