def operator
  Proc.new
end

add = operator { |*arr| arr.inject { |t, i| t + i } }
sub = operator { |*arr| arr.inject { |t, i| t - i } }
mul = operator { |*arr| arr.inject { |t, i| t * i } }
div = operator do |*arr|
  if arr.slice(1, arr.length).include?(0)
    'can not div by zero'
  else
    arr.inject { |t, i| t / i }
  end
end

p add.call(1, 2, 3)
p sub.call(2, 3)
p mul.call(1, 2, 3)
p div.call(12, 2, 2)
