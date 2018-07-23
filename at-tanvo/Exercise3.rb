class ArrayClone
  attr_accessor :array
  def initialize
    @array = []
    @length = 0
  end

  def map
    new_array = []
    @array.each { |i| new_array << yield(i) }
    new_array
  end

  def select
    new_array = []
    @array.each { |i| new_array << i if yield(i) }
    new_array
  end
end

arr = ArrayClone.new
arr.array = [1, 2, 3, 4]
p arr
new_arr = arr.map { |i| i + 2 }
p new_arr
new_arr2 = arr.select(&:even?)
p new_arr2
