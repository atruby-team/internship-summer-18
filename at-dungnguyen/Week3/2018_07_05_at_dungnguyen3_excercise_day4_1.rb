def find_index(str)
  count = Hash.new(0)
  arr = str.split('')
  arr.each { |j| count[j] += 1 }
  non_repeat_ch = count.key(1)
  return arr.index(non_repeat_ch) if non_repeat_ch
  -1
end

puts find_index 'nguyen quang dung'
