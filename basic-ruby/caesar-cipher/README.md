# caesar-cipher-ruby
Lesson from Odin Project

A Caesar cipher is a simple encryption technique that shifts each character in a string by a fixed number of positions in the alphabet.

# What You Will Learn

- Methods: how to create and call a method
- Strings: character operations with `.each_char`, `.ord`, `.chr` and `<<`
- Blocks: using a block with `.each_char` and block parameters
- Variables: scope inside methods and blocks
- Implicit return: methods return the last expression
- Operators: arithmetic with `+`, modulo `%`
- Output: using `puts` to print results

# How It Works

The method `caesar_cipher(text, shift)` takes two parameters:
- `text`: the string to encrypt
- `shift`: how many positions to shift each character

Example:
```
caesar_cipher('y', 2)
#=> {character with code of 'y' + 2}
```

# Code Walkthrough

```ruby
def caesar_cipher(text, shift)
  cipher = ""
  text.each_char do |char|
    char_code = char.ord + shift%26
    char = char_code.chr
    cipher << char
  end
  cipher
end
```

- `def caesar_cipher(text, shift)` declares a method named `caesar_cipher` with two parameters
- `cipher = ""` creates an empty string to store the result
- `text.each_char do |char|` loops through each character in the text
- `char.ord` converts the character to its ASCII code (a number)
- `char_code.chr` converts the code back to a character
- `cipher << char` adds the new character to the result string
- the method ends with `cipher`, so it returns the encrypted text

# Important Methods

**String methods used:**
- `.each_char` - iterates each character in a string
- `.ord` - returns the ASCII code of a character
- `.<<` - appends a string to another string

**Integer methods used:**
- `.chr` - converts a number to its character
- `%` - modulo operator (returns the remainder)

# How to Run

```
ruby caesar-cipher.rb
```

# Challenges to Try

- Only shift letters (a-z, A-Z), leave other characters unchanged
- Preserve uppercase and lowercase letters
- Allow negative shift values
- Use `.map` instead of `.each_char` to solve it differently
- Add tests with Minitest or RSpec
