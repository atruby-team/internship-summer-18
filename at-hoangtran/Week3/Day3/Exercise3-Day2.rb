arr = [-4, -2, -3, -2, 1]
arr.sort!
max1 = arr.first * arr[1] * arr.last
max2 = arr.last * arr[arr.length - 2] * arr[arr.length - 3]
if max1 > max2
  max = max1
else
  max = max2
end
puts max
