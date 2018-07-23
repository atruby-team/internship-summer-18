add = lambda { |*n| n.inject { |x, y| x + y } }
sub = lambda { |*n| n.inject { |x, y| x - y } }
multi = lambda { |*n| n.inject { |x, y| x * y } }
div = lambda do |*n|
  n.inject { |x, y| y.zero? ? 'can not div by zero' : x / y }
end
puts add.call(5, 7, 4, 2)
puts sub.call(5, 7, 4, 2)
puts multi.call(5, 7, 4, 2)
puts div.call(9, 0)
