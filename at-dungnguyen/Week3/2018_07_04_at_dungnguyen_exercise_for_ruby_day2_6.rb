# Give an array and print sum of array
arr1 = [1, 2, 3, 4]
total = arr1.inject { |sum, i| sum + i }
puts total

# Create an array with elements from 0 to 1000 that can be divided by 3 and 5.
arr2 = (0..1000).select { |i| (i % 15).zero? }
puts arr2

# Give an array and remove odd numbers.
arr3 = [1, 2, 3, 4, 5, 6]
arr3.delete_if(&:odd?)
puts arr3

# Give a list of students with their scores, select all students have score greater or equal 8.
students = [{ Bob: 7 }, { Smith: 8 }, { Kate: 9 }]
students.each do |stu|
  stu.values.each do |score|
    print stu if score >= 8
  end
end
