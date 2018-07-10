def add_more(num)
  lambda { |x| x + num }
end

def multi_more(num)
  lambda { |x| x * num }
end

def compose(calc1, calc2)
  lambda { |num| calc2.call(calc1.call(num)) }
end

add4 = add_more(4)
p add4.call(5)
multi10 = multi_more(10)
p multi10.call(10)

add4_and_multi10 = compose(add4, multi10)
p add4_and_multi10.call(10)
multi10_and_add4 = compose(multi10, add4)
p multi10_and_add4.call(10)
