arr = [6, 4, 2, 3]
arr.map! { |n| n.even? ? 'even' : 'odd' }
puts arr
