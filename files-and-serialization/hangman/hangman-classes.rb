require 'json'

class Display
  attr_accessor :letters

  def initialize(size)
    @letters = Array.new(size, "_")
  end

  def show
    puts @letters.join(" ")
  end

  def update(word, guess)
    hit = false

    for i in (0...@letters.length)
      if word[i] == guess
        @letters[i] = guess
        hit = true
      end
    end

    hit
  end

  def win?(word)
    @letters.join == word
  end
end

class Player
  def guess(colors = nil)
    gets.chomp
  end
end

class Game
  def initialize
    words = File.readlines("google-10000-english-no-swears.txt", chomp: true)
    filtered = words.select { |word| word.length.between?(5, 12) }

    @word = filtered.sample
    @display = Display.new(@word.length)
    @player = Player.new
    @try = 0
    @win = false
  end

  def save_game
    data = {
      word: @word,
      display: @display.letters,
      try: @try
    }
    File.open("save.json", "w") { |f| f.write(JSON.dump(data)) }
    puts "Game saved!"
  end

  def load_game
    return unless File.exist?("save.json")

    data = JSON.parse(File.read("save.json"))
    @word = data["word"]
    @display.letters = data["display"]
    @try = data["try"]
    puts "Game loaded!"
  end

  def play
    while !@win && @try < 5

      puts "Do you want to save? [y/n]"
      save = gets.chomp
      save_game if save == "y"

      puts "Do you want to load? [y/n]"
      load = gets.chomp
      load_game if load == "y"

      @display.show
      puts "Guess a letter:"
      guess = @player.guess

      hit = @display.update(@word, guess)
      @try += 1 unless hit

      puts "You have #{5 - @try} tries left"

      @win = true if @display.win?(@word)
    end

    end_game
  end

  def end_game
    if @win
      puts "You Win!"
    else
      puts "You Lose! The word is #{@word}"
    end
  end
end

game = Game.new
game.play
