a = [1, 2, 3, 1]
a.map! { |x| x.even? ? 'even' : 'odd' }
puts a
