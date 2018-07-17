arr = [-4, -3, -2, -1]

def max_product(arr)
  n = arr.length
  return -1 if n < 3
  arr.sort!
  [arr[0] * arr[1] * arr[n - 1], arr[n - 1] * arr[n - 2] * arr[n - 3]].max
end

if max_product(arr) == -1
  puts 'Array Input Error'
else
  puts max_product(arr)
end
