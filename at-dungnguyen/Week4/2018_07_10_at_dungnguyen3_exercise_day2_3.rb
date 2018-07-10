class ArrayClone
  attr_accessor :array
  def initialize
    @array = []
    @length = 0
  end

  def map(&block)
    result = []
    @array.each { |i| result << yield(i) }
    result
  end

  def select(&block)
    result = []
    @array.each { |i| result << i if yield(i) }
    result
  end
end

arr = ArrayClone.new
arr.array = [1, 2, 3, 5, 6]

p arr.array
new_arr = arr.map { |i| i + 1 }
p new_arr
p arr.select(&:even?)
