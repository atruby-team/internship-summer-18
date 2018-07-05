puts "Nhap phan tu mang :"
a = gets.to_i
arr = []
for i in 1..a
  b = gets.to_i
  arr.push(b)  
end
if arr.uniq!
  puts true
else
  puts false
end  