def exist?(arr)
  return true if arr.uniq.length == arr.length
  false
end

arr = [1, 2, 3, 4]

puts exist?(arr)
