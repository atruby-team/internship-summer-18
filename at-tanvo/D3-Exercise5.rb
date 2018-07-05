puts "Nhap phan tu mang :"
a = gets.to_i
arr = []
for i in 1..a
  b = gets.to_i
  arr.push(b)  
end
hash_count = Hash.new
arr.each {|i| hash_count[i] = arr.count(i)}
puts hash_count