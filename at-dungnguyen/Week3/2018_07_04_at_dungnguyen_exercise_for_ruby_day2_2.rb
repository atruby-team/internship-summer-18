arr = [1, 2, 3, 1]

arr.map! { |x| x.even? ? 'even' : 'odd' }

print arr
