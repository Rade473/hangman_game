class Game

def initialize
  @key = generate_key()
  @clues = []
  @lives = 10
  p @key

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
end