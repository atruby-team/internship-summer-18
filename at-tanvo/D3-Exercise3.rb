arr = [-5, -2, 3, 4]
arr.sort!
max1 = arr.first * arr[1] * arr.last
max2 = arr.last * arr[arr.length - 2] * arr[arr.length - 3]
max = if max1 > max2
        max1
      else max2
      end
puts max.to_s
