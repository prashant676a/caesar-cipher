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

  def computer_player(guesses_so_far)
    # If this is the first guess, make a random guess
    if guesses_so_far.empty?
      return ['red', 'green', 'blue', 'black'].sample(4)
    end

    # Get the latest guess and the corresponding hint
    latest_guess = guesses_so_far.last
    hint = give_hint(latest_guess)

    # Use the hint to make a new guess
    new_guess = latest_guess.dup
    hint.each do |i|
      new_guess[i] = @colors[i]
    end

    # If the new guess is the same as the previous one, try a random guess
    if new_guess == latest_guess
      new_guess = ['red', 'green', 'blue', 'black'].sample(4)
    end

    return new_guess
  end

  def play_game
    print "choose p for player and m for mastermind: "
    chosen = gets.chomp

    guesses_so_far=[]

    if chosen == 'p'
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

  else
    print "set the colors for computer to guess: "
    @colors = get_input
    computer_guess = computer_player(guesses_so_far)
    guesses_so_far.append(computer_guess)

    if guesses_so_far[-1]==@colors
      puts "you win computer wow, impressive"
      break
    end

  end
end


g = Game.new
g.play_game
