# caesar-cipher-ruby
Lesson from Odin Project

**Overview**
- **Purpose**: This lesson demonstrates a minimal Caesar cipher implementation in Ruby and is intended as a compact source for learning core Ruby concepts.
- **Source file**: See [caesar-cipher.rb](caesar-cipher.rb#L1-L12) for the complete example used throughout this lesson.

**What You Will Learn**
- **Method definition and invocation**: how to declare a method with `def`/`end` and call it with arguments.
- **Strings and character operations**: `String#each_char`, `String#<<`, `String#ord`, and `Integer#chr`.
- **Blocks and block parameters**: passing a block to `each_char` and using `|char|` as a local block variable.
- **Local variables and scope**: assignment inside methods and blocks, and how values flow back via the method's return value.
- **Implicit return values**: Ruby methods return the last evaluated expression unless `return` is used explicitly.
- **Operator usage**: arithmetic, modulo `%`, and method chaining.
- **Top-level Ruby execution**: using `puts` to print results and running scripts with `ruby`.
- **Mutable string manipulation**: using `<<` to append to a string in-place.

**Code Walkthrough**
- **Method header**: `def caesar_cipher(text, shift)` declares a method named `caesar_cipher` which accepts two parameters: `text` (a `String`) and `shift` (an `Integer`).
- **Accumulator initialization**: `cipher = ""` creates an empty `String` used to collect transformed characters.
- **Iteration**: `text.each_char do |char|` iterates each character in the input string and yields it to the block as `char` (a `String` of length 1).
- **Character to code and back**: `char.ord` converts a character to its integer codepoint; adding `shift%26` demonstrates numeric arithmetic and uses modulo to constrain the shift magnitude. `char_code.chr` converts an integer back to a single-character string.
- **Appending**: `cipher << char` appends the resulting character to the accumulator in-place.
- **Return**: the method ends with `cipher` on the final line, so Ruby returns the built string implicitly.
- **Printing**: `puts caesar_cipher('y', 2)` invokes the method and prints its result to standard output.

**Ruby Concepts Highlighted (detailed)**
- **Everything is an object**: Strings, integers, and methods operate on objects (`String#each_char`, `String#ord`).
- **Imperative vs. idiomatic Ruby**: This code is imperative and clear, but Ruby also offers more idiomatic alternatives (e.g., `String#tr`, `String#bytes`, or `Array#map` with `join`).
- **Mutable vs. immutable behavior**: `<<` mutates `cipher`, which is efficient for building strings compared to using `+` in loops.
- **Blocks and closures**: The block passed to `each_char` demonstrates a simple closure that captures no external variables other than those in method scope.
- **Implicit return**: The last expression `cipher` is returned automatically — a fundamental Ruby idiom.

**Practical limitations in the example (learning opportunities)**
- **No alphabet checks**: The implementation converts all characters (including punctuation and whitespace) using `ord`/`chr`, which can produce non-letter characters; learn to use `String#match?`, character ranges, or ASCII ranges to restrict shifts to letters only.
- **Encoding and `chr` pitfalls**: `Integer#chr` depends on integer values and encoding; shifting values beyond valid codepoints may raise exceptions for some inputs or encodings. Learn about UTF-8 and `Encoding` in Ruby.
- **Case preservation**: The example does not preserve case or restrict shifts within `a..z` or `A..Z`. Implementing conditional logic based on `char =~ /[a-z]/` or `char =~ /[A-Z]/` is a useful exercise.

**How to run this lesson**
Run the file with Ruby from the repository root:

```bash
ruby caesar-cipher.rb
```

**Recommended exercises (practice tasks)**
- **Fix non-letter handling**: Modify the method so only letters are shifted; non-letters should be appended unchanged.
- **Preserve case**: Ensure uppercase letters remain uppercase after shifting and lowercase remain lowercase.
- **Support negative shifts**: Allow negative `shift` values and verify correct wrapping.
- **Implement using `map`**: Reimplement the transformation using `text.each_char.map { ... }.join` to practice `Enumerable` and `Array` manipulation.
- **Add tests**: Write unit tests with Minitest or RSpec covering edge cases (wrap-around, non-letters, empty string, large shift values).
- **Add CLI args**: Accept input text and shift from `ARGV` and show usage/help text.

**Next steps and resources**
- **Official docs**: Read the Ruby docs for `String`, `Enumerable`, and `Integer` to deepen understanding.
- **Style & linter**: Explore `rubocop` to learn common Ruby style conventions.
- **Further reading**: Look into character encodings (`Encoding`), performance differences between concatenation strategies, and idiomatic Ruby enumerables.

**Appendix — quick notes**
- **File reference**: main example is [caesar-cipher.rb](caesar-cipher.rb#L1-L12).
- **Run command**: `ruby caesar-cipher.rb` prints the example output.

If you'd like, I can: create tests, implement the improved cipher (preserving letters and case), or commit and push the README and changes. Which next step do you prefer?
