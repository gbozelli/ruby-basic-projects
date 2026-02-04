def substrings(string, dictionary)
  list_of_strings = string.split(" ")
  superstring = ""
  list_of_strings.each do |word|
    superstring << word 
  end
  size = superstring.length
  hash = Hash.new(0)
  dictionary.each do |word|
    window = word.length
    for i in (0..(size-window))
      puts superstring[i..window+i]
      if superstring[i..window+i] == word
        hash[word] += 1
      end
    end
  end
  hash
end

string = "below"
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings(string, dictionary)