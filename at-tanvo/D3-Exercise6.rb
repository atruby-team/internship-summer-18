# Tổng của mảng
puts "Nhap phan tu mang :"
a = gets.to_i
arr = []
for i in 1..a
  b = gets.to_i
  arr.push(b)  
end
b = arr.reduce(:+)
puts "Tổng của mảng : #{b}"  