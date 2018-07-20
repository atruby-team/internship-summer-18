arr = [1, 2, 3, 1]
# Give an array and print sum of array
puts arr.sum

# Create an array with elements from 0 to 1000 that can be divided by 3 and 5
a = (1..100).select { |i| (i % 15).zero? }
puts a

# Give an array and remove odd numbers
arr.select!(&:even?)
puts arr

# Give a list of students with their scores, select all students have score greater or equal 8
students = [{ Bob: 7 }, { Smith: 8 }, { Kate: 9 }]
students.select { |x| x.values[0] >= 8 }
puts students
