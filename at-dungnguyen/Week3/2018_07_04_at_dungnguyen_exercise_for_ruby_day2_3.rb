arr = [-1, -1, -1]

def max_product(arr)
  n = arr.length
  if n < 3
    puts 'Error Array Input'
  else
    arr.sort!
    puts [arr[0] * arr[1] * arr[n - 1], arr[n - 1] * arr[n - 2] * arr[n - 3]].max
  end
end

max_product(arr)
