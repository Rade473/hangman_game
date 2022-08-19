#Game logic and game instances happen here
class Game

def initialize
  @key = generate_key.split('')
  @clues = []
  @guess = Array.new(@key.length, '_')
  @tried_letters = []
  @lives = 10
  @display = []
  p @key
  puts @guess.join('')
  player_choice

end

def generate_key
  dictionary = File.readlines('dictionary.txt')
  filtereddictionary = []
  dictionary.each do |word|
    word = word[0..-2]
    if word.length >=5 && word.length <= 12
      filtereddictionary.push(word)
    end
  end
filtereddictionary.sample
end

def player_choice
  until @guess == @key || @lives <= 0
    puts "You have #{@lives} tries left"
    userinput = gets.chomp.downcase
    return 'save' if userinput == 'save'
    if userinput.length == 1 && ('a'..'z').include?(userinput)
      try_letter(userinput)
      compare_guess(userinput)
    else
      puts 'Invalid input, please enter a letter'
      print '> '
    end
  end
end

def compare_guess(input)
  @key.each_with_index do |letter, i|
    if letter == input
      @guess[i] = @key[i]
    end
  end
  puts @guess.join('')
end

def try_letter(input)
  if @tried_letters.include?(input)
   puts "You already tried that letter"
  elsif @key.include?(input)
    @tried_letters.push(input)
    display_tries(@tried_letters)
  else 
    @tried_letters.push(input)
    @lives += -1
    display_tries(@tried_letters)
  end
end

def over?
  @guess == @key || @lives <= 0
end

def display_tries(input)
  @display = []
  input.each do |letter|
    if @key.include?(letter)
      @display.push(letter.green)
    else 
      @display.push(letter.red)
    end
    puts @display.join(' ')
  end
end
end