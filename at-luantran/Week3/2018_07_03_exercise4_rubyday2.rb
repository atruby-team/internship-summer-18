def distinct(arr)
  arr.uniq! ? true : false
end

a = [1, 2, 3, 1]
puts distinct a

b = [1, 2, 3, 4]
puts distinct b

c = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
puts distinct c
