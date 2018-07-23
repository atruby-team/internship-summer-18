arr = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
result = {}
arr.each { |x| result[x] = arr.count(x) }
puts result
