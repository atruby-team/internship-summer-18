def IsPrime number
  for i in 2...number
    return false if (number % i == 0 && i != number)
  end
  return true
end

puts IsPrime 8
