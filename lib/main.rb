require_relative 'color'
require_relative 'hangman'
require_relative 'game'

def start
  puts "Hangman. Would you like to:"
  puts "1 - Start a new game"
  puts "2 - Load game"
  
  while newgamechoice = gets.chomp.to_i
    case newgamechoice
    when 1
      Game.new
      break
    when 2
      puts 'Load game'
      break
    else 
      puts "Invalid input. Please try again, use 1 or 2"
      print '> '
    end
  end
end

start()