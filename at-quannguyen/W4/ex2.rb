add4 = ->(x) { x + 4 }
multi10 = ->(x) { x * 10 }
add4_and_multi10 = ->(x) { add4.(x) * x }
multi10_and_add4 = ->(x) { multi10.(x) + 4 }

puts add4.(5)
puts add4.(10)
puts multi10.(10)
puts multi10.(5)
puts add4_and_multi10.(10)
puts multi10_and_add4.(10)
