def operator
  Proc.new
end

add = operator { |*arr| arr.inject(:+) }
sub = operator { |*arr| arr.inject(:-) }
mul = operator { |*arr| arr.inject(:*) }
div = operator do |*arr|
  begin
    arr.inject(:/)
  rescue StandardError
    puts 'can not div by zero'
  end
end

p add.call(2, 5, 6)
p sub.call(2, 3)
p mul.call(1, 2, 3)
p div.call(1, 2, 0)
