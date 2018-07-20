def non_repeat(string)
  hash = {}
  string.each_char { |_str| hash[_str] = ((hash[_str] || 0) + 1) }
  num = hash.key(1)
  num ? string.index(num) : -1
end
puts non_repeat 'rrrrrubyteam'
puts non_repeat 'asiantech'
puts non_repeat 'aaaaaaaaaaaa'
