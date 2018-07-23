class Array
  def sum
    self.inject { |total, i| total + i }
  end
end
puts [1, 2, 3, 4].sum
