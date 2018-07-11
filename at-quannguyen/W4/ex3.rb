class ArrayClone
  attr_accessor :array, :length
  def initialize
    self.array = []
    self.length = 0
  end

  def map(&block)
    result = []
    @array.each { |e| result << yield(e) }
    result
  end

  def select(&block)
    result = []
    @array.each { |e| result << i if yield(e) }
    result
  end

  def a_length
    @array.each { |_e| @length += 1 }
    @length
  end
end

arr = ArrayClone.new
arr.array = [1, 2, 3, 5, 6]

p arr.array.length
new_arr = arr.map { |i| i + 1 }
p new_arr
p arr.select do |i|
  i > 3
end
