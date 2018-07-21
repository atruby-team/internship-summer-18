def add_more(num)
  ->(i) { i + num }
end

def multi_more(num)
  ->(i) { i * num }
end

def compose(lambda1, lambda2)
  ->(i) { lambda2.call(lambda1.call(i)) }
end
add4 = add_more(4)
add10 = add_more(10)
multi10 = multi_more(10)
multi5 = multi_more(5)
puts add4.call(5)
puts add10.call(12)
puts multi10.call(10)
puts multi5.call(10)
add4_and_multi10 = compose(add4, multi10)
puts add4_and_multi10.call(10)
multi10_and_add4 = compose(multi10, add4)
puts multi10_and_add4.call(10)
