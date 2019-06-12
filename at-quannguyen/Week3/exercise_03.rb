def fnPerfect num
  sum = 0
  for i in 1...num
    sum += i if num % i == 0
  end
  return true if sum == num
  return false
end
number = 6
puts fnPerfect(6) ?
  "#{number} is PERFECT NUMBER" : "#{number} is NOT PERFECT NUMBER"
