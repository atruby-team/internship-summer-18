def add_more(num)
  ->(x) { x + num }
end

def multi_more(num)
  ->(x) { x * num }
end

def compose(proc1, proc2)
  ->(x) { proc2.call(proc1.call(x)) }
end

add4 = add_more(4)
add10 = add_more(10)

multi10 = multi_more(10)
multi5 = multi_more(5)

add4_and_multi10 = compose(add4, multi10)
multi10_and_add4 = compose(multi10, add4)

p add4.call(5)
p add10.call(12)

p multi10.call(10)
p multi5.call(10)

p add4_and_multi10.call(10)
p multi10_and_add4.call(10)
