class Array
  def sum
    if self.all? { |i| i.is_a? Integer }
      self.inject(0, :+)
    else
      nil
    end
  end
end

p [1, 2, 3, 4].sum
