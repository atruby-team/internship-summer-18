def sum_is_integer nums
  nums.all?(Integer) ? nums.inject(0, :+) : false
end

puts sum_is_integer [1 , 2, 3, 4]
