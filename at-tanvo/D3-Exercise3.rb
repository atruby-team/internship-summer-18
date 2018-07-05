puts "Nhap phan tu mang :"
a = gets.to_i
arr = []
for i in 1..a
  b = gets.to_i
  arr.push(b)  
end
max = 0
arr.combination(3) do |n|
  b = n.reduce(1, :*)
  max = b if b > max
end
puts "#{max}"  