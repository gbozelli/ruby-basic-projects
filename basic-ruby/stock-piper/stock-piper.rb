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

puts stock_piper([17,3,6,9,15,8,6,1,10])