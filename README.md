# basic-ruby-projects

Ruby is very object-oriented. It means that everything in Ruby is an object

# Basic Data Types
## Numbers
Ruby has two types of numbers:
  - Integers: like 10
  - Floats: like 10.5

Every operation between two integers result in a integer 

To convert integers to float and vice-versa, use `.to_i` and `.to_f` 

Ruby just cut the decimal places, doesnt round

**Useful methods**
  - `.even?`
  - `.odd?`
## Strings
Ruby has two quotation marks:
  - `""`
  - `''`

Concatenation
- `text + text` operator
- `text << text` operator
- `text.concat(text)` method

Substrings
- works like a array
- use index like `[i]`
`[i..j]`
`[i, j]`
`[-i]`

Interpolation
- used to put variable in string

```
name = Odin

puts "Hello, #{name}" #=> "Hello, Odin"
```

**Useful methods**
- `.capitalize`
- `.include?(text)`
- `.upcase`
- `.downcase`
- `.empty?`
- `length`
- `reverse`
- `split`
- `strip`
- `sub(char, char)`
- `gsub(char, char)`
- `insert(position, string)`
- `delete(char)`

Converting object to string

- `.to_s`

## Symbols

Strings need to be stored even if an existing string exists with same value. Symbols only are stored once

How to use:
- `:my_symbol`

## Booleans

- true
- false
- nil (null?)

# Variables

Variables are a way of assigning data to names in your programs. 

## Declaring a variable

This is how to create a variable in Ruby:

`age = 18`

You can also assign the result of an expression to a variable:

`age = 18 + 5 #=> 23`

Variable names are reusable, so you can assign a new value to a variable at any point in your program. 

```
age = 18
age #=> 18
age = 33
age #=> 33
```

## Assignment Operators

Ruby provides shorthand assignment operators for this:

- `+=` adds and assigns: `age += 4 #=> 22`
- `-=` subtracts and assigns: `age -= 2 #=> 16`
- `*=` multiplies and assigns: `cash *= 2 #=> 20`
- `/=` divides and assigns: `temperature /= 10 #=> 4`

## How to name variables

Variable names should always be **lowercase**, and multiple words should be split by an **underscore**. This is known as **snake_case**.

```
# bad
a = 19
string = "John"

# good
age = 19
name = "John"
can_swim = false
```

## References

Variables are references (or pointers) to addresses in memory. This means assigning variables to other variables can have unintended side effects.

Example:
```
desired_location = "Barcelona"
johns_location = desired_location

desired_location  #=> "Barcelona"
johns_location    #=> "Barcelona"
```

If you modify the string using a mutating method like `upcase!`, both variables will reflect that change:

```
johns_location.upcase!  #=> "BARCELONA"

desired_location        #=> "BARCELONA"
johns_location          #=> "BARCELONA"
```

This happens because both variables point to the same memory address. Remember: just because you can assign variables to other variables, doesn't mean you should.

# Input and Output

## Output commands:
- `print`:outputs in the same line
- `puts`:outputs in new lines

## Input commands:
- `gets`: waits for user input

# Conditional Logic
- `if`, `elsif` and `else`
 
```
if condition
  action
elsif other condition
  other action
else 
  other other action
end
```
or

```
action if condition
```
- `unless`:oposite as if

# Loops
- `loop`
```
loop do
  action
  break if condition
end
```
- `while`
```
while condition
  action
end
```
- `until`: opposite as `while`
```
until condition
  action
end
```
- `for`
```
for i in (j..k)
  action
end
```
- `times`
```
number.times do 
  action
end
```
- `.upto` and `.downto`
```
5.upto(10) { |num| print "#{num} " }     #=> 5 6 7 8 9 10

10.downto(5) { |num| print "#{num} " }   #=> 10 9 8 7 6 5

```

# Arrays

Two types:
- `array = [elem_1]`
- `Array.new(1, elem_1)`

## Acessing

```
str_array = ["This", "is", "a", "small", "array"]

str_array[0]            #=> "This"
str_array[1]            #=> "is"
str_array[4]            #=> "array"
str_array[-1]           #=> "array"
str_array[-2]           #=> "small"

```

Methods:
- `.first(n)`
- `.last(n)`

## Adding and removing elements

- `.push(elem_1, ... , elem_n)`
- `<< elem`
- `.pop`
- `.unshift(elem)`
- `.shift`

## Adding and subtracting arrays
- `array1 + array2`
- `array1.concat(array2)`

## Methods

-`.empty?`
-`.length`
-`.reverse`
-`.include?`
-`.join`

# Hashes

A better version of arrays. Use names instead of using index.

## Creating
```
my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}
```
or 
```
my_hash = Hash.new
my_hash               #=> {}

```

## Acessing

```
hash[value]
hash.fetch(value, message)
```

## Adding and removing

```
hash[value] = other_value
hash.delete(value)
```

## Methods

- `hash.keys`
- `hash.values`
- `hash1.merge(hash2)`

## Symbols as keys

```
# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}

```

# Methods

```
def method(arguments)
  action
end

method(arguments) => action
```
- Default parameters: `arguments = x`
- Return doesnt need to be wrote, unless in specific cases, like check a input

# Enumerable methods
- `.each`: for each element do a action

```
my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end
```
- `.each_with_index`

```
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]

```
- `map`
```
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

```

- `select`
```
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

 #=> ["Sharon", "Leo", "Leila", "Arun"]

```

- `reduce`
```
my_numbers = [5, 6, 7, 8]

my_numbers.reduce { |sum, number| sum + number }
#=> 26
```