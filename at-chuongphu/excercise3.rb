# ex1
print 'Enter score: '
score = gets.to_f
if score < 6.0
  puts 'F'
elsif score >= 9.0
  puts 'A'
elsif score >= 6.0 && score < 7.0
  puts 'D'
elsif score >= 7.0 && score < 8.0
  puts 'C'
elsif score >= 8.0 && score < 9.0
  puts 'B'
else
  puts 'invailid'
end
# ex2
a = [1, 2, 3, 1]
a.map! do |_number|
  x = if numer.even?
        'even'
      else
        'odd'
      end
end
puts a
# ex3
a = [1, 2, 5, 6, 2]
max = 0
a.combination(3).to_a do |x|
  multi = x.reduce(1, :*)
  max = multi if multi > max
end
# ex4
a = [1, 2, 3, 1]
if a.uniq!
  puts true
else
  puts false
end
# ex5
# ex6
# sum of array
a = [1, 2, 3, 1]
a.inject { |sum, i| sum + i }
# array from 0 to 1000 that can divide by 3 and 5

# array that remve odd number
a.each { |x| a.delete(x) if x.odd? }
