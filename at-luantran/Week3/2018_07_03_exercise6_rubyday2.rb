# Give an array and print sum of array
a = [1, 2, 3, 1]
sum = a.inject { |n, i| n + i }
puts sum

# Create an array with elements from 0 to 1000 that can be divided by 3 and 5.
b = (0..1000).find_all { |i| (i % 3).zero? && (i % 5).zero? }
puts b

# Give an array and remove odd numbers.
a.each { |x| a.delete(x) if x.odd? }
puts a

# Give a list of students with their scores, select all students have score greater or equal 8.
c = [{ Bob: 7 }, { Smith: 8 }, { Kate: 9 }]
c.each do |x|
  # c.delete(x) if x.values[0] < 8
  x.values.each { |d| puts x if d >= 8 }
end
