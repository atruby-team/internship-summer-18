class ArrayClone
  attr_writer :array
  def initialize
    @array = []
    @length = 0
  end

  def map
    arr_out = []
    @array.each { |x| arr_out.push(yield(x)) }
    arr_out
  end

  def select
    arr_out = []
    @array.each do |x|
      arr_out.push(x) if yield(x)
    end
    arr_out
  end
end

arr_clone = ArrayClone.new
arr_clone.array = [1, 2, 3, 4]
p arr_clone.select(&:even?)
arr_out = arr_clone.map { |x| x + 1 }
p arr_out
