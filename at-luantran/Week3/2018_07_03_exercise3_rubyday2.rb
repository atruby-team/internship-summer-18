max = 0
arr = [-1, 2, 3, 4]
b = arr.combination(3).to_a
b.each do |x|
  c = x.reduce(1, :*)
  max = c if c > max
end

puts max
