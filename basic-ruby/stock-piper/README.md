# stock-piper
Lesson from Odin Project

The `stock_piper` method solves the stock trading problem: given an array of stock prices for each day, find the best day to buy and the best day to sell to maximize profit. The method returns the indices of the buy day (lowest price) and sell day (highest price) that come after it.

# What You Will Learn

- Arrays: indexing and accessing elements
- Loops: nested `for` loops with ranges
- Variables: tracking minimum and maximum values
- Comparisons: using conditional logic to find the best profit
- Implicit return: methods return the last expression
- Array ranges: using `...` (exclusive) vs `..` (inclusive)

# How It Works

The method `stock_piper(days)` takes one parameter:
- `days`: an array of integers representing stock prices for each day

It returns:
- An array `[buy_index, sell_index]` where `buy_index` is the index of the lowest price and `sell_index` is the index of the highest price after it

Example:
```
stock_piper([17, 3, 6, 9, 15, 8, 6, 1, 10])
#=> [7, 4]
# Day 7 (price 1) is the best day to buy
# Day 4 (price 15) is the best day to sell for max profit of 14
```

# Code Walkthrough

```ruby
def stock_piper(days)
  n = days.length
  minor = 0
  major = 0
  diff = 0
  for i in (0...n)
    for j in (i+1...n)
      if (days[j] - days[i]) > diff
        diff = days[j] - days[i]
        minor = i
        major = j
      end
    end
  end
  [minor, major]
end
```

- `n = days.length` gets the array length
- `minor`, `major`, and `diff` track the buy index, sell index, and maximum profit
- `for i in (0...n)` loops through each day as a potential buy day (note: `...` is exclusive, so it goes from 0 to n-1)
- `for j in (i+1...n)` loops through subsequent days as potential sell days
- `days[j] - days[i]` calculates the profit if buying on day `i` and selling on day `j`
- When a larger profit is found, update `diff`, `minor`, and `major`
- Return `[minor, major]` as the buy and sell indices

# Important Methods

**Array methods used:**
- `.length` - returns the number of elements in an array
- Array indexing with `[index]` - accesses an element at a specific position

**Loop constructs used:**
- `for` loop with ranges `(start...end)` - exclusive range (end is not included)
- Nested loops for comparing all pairs of days

**Operators used:**
- `-` (subtraction) - calculates profit between prices
- `>` (greater than) - compares profits to find the maximum

# How to Run

```bash
ruby stock-piper/stock-piper.rb
```

# Challenges to Try

- Handle edge cases: what if prices only go down? What if there's only one day?
- Return the actual profit amount instead of indices
- Modify the algorithm to track all possible buy-sell combinations with their profits
- Optimize from O(n²) nested loops to O(n) with a single pass (track minimum as you iterate)
- Make it case-insensitive or work with different input formats
- Add tests using Minitest or RSpec to verify correctness

# Notes

This README follows the style of the `caesar-cipher` exercise. The stock piper problem is a classic algorithm challenge that teaches nested iteration and conditional tracking.
