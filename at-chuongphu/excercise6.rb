# ex1
cong = proc { |*ar| ar.inject { |a, b| a + b } }
tru = proc { |*ar| ar.inject { |a, b| a - b } }
nhan = proc { |*ar| ar.inject { |a, b| a * b } }
chia = proc do |*ar|
  ar.inject { |a, b| a / b unless b.zero? }
end
p cong.(3, 1, 4)
p tru.(7, 2)
p nhan.(5, 2)
p chia.(100, 5, 2)
# ex2
def add_more(num)
  proc { |x| num + x }
end

def multi_more(num)
  proc { |x| num * x }
end

def compose(proc1, proc2)
  proc { |x| proc2.call(proc1.call(x)) }
end

add4 = add_more(4)
p add4.call(5)

multi5 = multi_more(5)
p multi5.call(10)

add4_and_multi5 = compose(add4, multi5)
p add4_and_multi5.call(10)
