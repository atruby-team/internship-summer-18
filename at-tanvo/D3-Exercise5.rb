arr = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
hash_count = {}
arr.each { |i| hash_count[i] = arr.count(i) }
puts hash_count
