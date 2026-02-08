require 'json'

words = File.readlines("google-10000-english-no-swears.txt", chomp: true)
filtered_words = words.select { |word| word.length.between?(5, 12) }
random_word = filtered_words.sample
display = Array.new(random_word.length, "_")
win = false
try = 0
save = false

while !win and try < 5

  puts "Do you want do save? [y/n]"
  text = gets.chomp
  if text == "y"
    data = { word: random_word, display: display, try: try}
    json_string = JSON.dump(data)
    File.open("save.json", "w") { |f| f.write(json_string) }
    puts "Game saved!"
  end 

  puts "Do you want do load? [y/n]"
  text = gets.chomp
  if text == "y" and File.exist?("save.json")
    data = loaded_data = JSON.parse(File.read("save.json"))
    random_word = data["word"]
    display = data["display"]
    try = data["try"]
    puts "Game loaded!"
  end 
  
  puts display.join(" ")
  puts 'Guess a letter: '
  guess = gets.chomp
  hit = false
  for i in (0...display.length)
    if random_word[i] == guess
      display[i] = guess
      hit = true
    end
  end
  try += 1 unless hit
  puts "You have #{5-try} tries"
  if display.join == random_word
    win = true 
  end
end

puts "You Lose! The word is #{random_word}" unless win