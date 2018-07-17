arr = [-5, -7, -4, -5, -8]
max = arr.last(3).reduce(1, :*)
b = arr.combination(3).to_a
b.each do |x|
  c = x.reduce(1, :*)
  max = c if c > max
end

puts max

arr.sort!
max1 = arr.last(3).reduce(1, :*)
max1 = arr.first(2).reduce(1, :*) * arr.last if arr.first(2).reduce(1, :*) * arr.last > max1
puts max1
