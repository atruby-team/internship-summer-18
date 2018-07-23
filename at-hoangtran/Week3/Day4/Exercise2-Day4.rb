class Array
  def sum
    self.inject { |x, y| x + y }
  end
end
p [1, 2, 3, 4].sum
