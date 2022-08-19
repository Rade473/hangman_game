require_relative 'color'
require_relative 'hangman'
require_relative 'game'
require 'yaml'

  puts "Hangman. Would you like to:"
  puts "1 - Start a new game"
  puts "2 - Load game"
  
  while newgamechoice = gets.chomp.to_i
    case newgamechoice
    when 1
      game = Game.new
      break
    when 2
      game = load_game()
      break
    else 
      puts "Invalid input. Please try again, use 1 or 2"
      print '> '
    end
  end

def save_game(game)
  puts 'Enter file name to save the game'
  filename = gets.chomp
  savefile = File.open("../saved/#{filename}", 'w') {|f| f.write(YAML.dump(game)) }
end

def load_game


end

until game.over?
  if game.player_choice == 'save'
    if save_game(game)
      puts "Your game has been saved. Thanks for playing!"
      break
    end
  end
end



