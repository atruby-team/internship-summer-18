def operator
  Proc.new
end

add = operator { |*number| number.reduce(:+) }
sub = operator { |*number| number.reduce(:-) }
multi = operator { |*number| number.reduce(:*) }
div = operator do |*number|
  if number[1..number.length - 1].include? 0
    'Can not div by zero'
  else
    number.reduce(:/)
  end
end
p add.call(1, 2, 3)
p sub.call(1, 2, 3)
p multi.call(1, 2, 3)
p div.call(0, 0, 3.1)
