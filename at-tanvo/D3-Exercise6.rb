# Tổng của mảng
arr = [1, 2, 3, 1]
b = arr.reduce(:+)
puts "Tổng của mảng : #{b}"

# Create an array with elements from 0 to 1000 that can be divided by 3 and 5.
arr2 = (0..1000).select { |i| (i % 3).zero? && (i % 5).zero? }
puts arr2

# Give an array and remove odd numbers.
arr3 = [2, 3, 4, 5, 6, 7, 8, 99]
arr3.delete_if(&:odd?)
puts arr3

# Give a list of students with their scores, select all students have score greater or equal 8.
students = [{ Bob: 7 }, { Smith: 8 }, { Kate: 9 }]

students.each do |n|
  n.values.each do |a|
    puts n if a >= 8
  end
end
