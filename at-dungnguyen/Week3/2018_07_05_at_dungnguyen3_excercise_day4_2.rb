class Array
  def sum
    return self.inject { |s, i| s + i } if self.all? { |j| j.is_a?(Integer) }
    nil
  end
end

puts [1, 5, 3].sum
