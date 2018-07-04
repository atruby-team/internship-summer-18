arr = [-10, -1, 2, 3, 4]
max = 0

arr.combination(3) do |x|
  a = x.reduce(1, :*)
  max = a if a > max
end

puts max
