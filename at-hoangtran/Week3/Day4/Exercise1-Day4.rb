def repeat(str)
  hash = Hash.new { 0 }
  arr = str.split('')
  arr.each { |x| hash[x] += 1 }
  num = hash.key(1)
  num ? str.index(num) : -1
end
puts repeat('rubyteam')
puts repeat('asiantech')
