# substrings
Lesson-style exercise from Odin Project

The `substrings` method takes a string and a dictionary (array of words) and returns a hash with counts of how many times each dictionary word appears as a substring inside the input string.

# What You Will Learn

- String manipulation: splitting, indexing and slicing
- Iteration: looping through arrays and ranges
- Hashes: counting occurrences with default values
- Off-by-one considerations when scanning substrings

# How It Works

`substrings(string, dictionary)` performs the following high-level steps:

- Splits the input `string` into words and joins them into a single `superstring` (removing spaces)
- For each word in the `dictionary`, it scans `superstring` with a sliding window of the word's length
- When a window equals the dictionary word, it increments that word's count in the result hash

# Code Walkthrough

```ruby
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
      if superstring[i...window+i] == word
        hash[word] += 1
      end
    end
  end
  hash
end
```

- `string.split(" ")` splits the input into words
- `superstring << word` concatenates words to remove spaces for substring scanning
- `Hash.new(0)` creates a hash that returns `0` for missing keys (useful for counting)
- The loop `for i in (0..(size-window))` scans every possible start index for the window

# Important Methods Used

- String: `.split`, slicing with `[start...end]` or `[start, length]`
- Hash: `Hash.new(default)` to set a default count
- Iteration constructs: `.each`, `for` with ranges

# How to Run

Run the example file from the repository root:

```bash
ruby substrings/substrings.rb
```

# Example

With `string = "below"` and the sample `dictionary`, the method returns a hash of counts for dictionary words found in the input.

# Challenges to Try

- Preserve spaces and detect substrings across word boundaries differently (if required)
- Make the search case-insensitive
- Return only words with count > 0
- Add tests using Minitest or RSpec
- Optimize by avoiding concatenation and scanning words within original spacing instead

# Notes

This README follows the style of the `caesar-cipher` exercise: short explanation, code walkthrough, methods used and running instructions.
