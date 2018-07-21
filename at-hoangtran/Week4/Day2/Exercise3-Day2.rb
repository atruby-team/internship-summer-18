class ArrayClone
  attr_accessor :arr
  def initialize
    @arr = []
    @length = 0
  end

  def map(&block)
    a = []
    @arr.each { |x| a.push(yield(x)) }
    a
  end

  def select(&block)
    a = []
    @arr.each { |x| a.push(x) if yield(x) }
    a
  end
end

array = ArrayClone.new
array.arr = [1, 4, 5, 2]
print array.arr
array2 = array.map { |x| x + 1 }
print array2
print array.select(&:even?)
