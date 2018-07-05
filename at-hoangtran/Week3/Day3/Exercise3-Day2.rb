max = 0
arr = [-4, -2, -3, -2, 3]
arr.combination(3) do |n|
  b = n.reduce(1, :*)
  max = b if b > max
end
puts max
