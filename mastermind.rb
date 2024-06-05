TURNS = 12

def get_input
  puts "Input 4 colors seperated by comma"
  print "Choose from four options {red,green,blue,black} in any order: "
  arr = gets.chomp.split(',')
  arr
end

def secret_color
  ['red','green','blue','black'].shuffle
end

class Game
  def initialize
    @colors = secret_color
  end

  def give_hint(array_user_input)
    match = []
    (0..3).each do
      |i|
      if array_user_input[i]==@colors[i]
        match.append(i)
      end
    end
    match
  end

  def play_game
    guesses_so_far=[]
    (1..TURNS).each do
      guesses_so_far.append(get_input)
      if guesses_so_far[-1] == @colors
        puts "You win.. HUrrah"
        break
      else
        puts "The guesses so far are #{guesses_so_far}"
        puts "The postion that match are : #{give_hint(guesses_so_far[-1])}\n\n"
        puts " "
      end
    end

  end
end


g = Game.new
g.play_game
