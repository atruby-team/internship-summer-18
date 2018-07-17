a = [1, 2, 3, 1]
hash = {}
a.each { |x| hash[x] = a.count(x) }
puts hash
