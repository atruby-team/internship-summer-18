arr = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
count_element = Hash.new(0)
arr.each { |i| count_element[i] += 1 }

puts count_element
