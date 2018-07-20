arr = [1, 2, 3, 1]
puts arr.to_s
arr.map! { |i| i.even? ? 'even' : 'odd' }
puts arr.to_s
