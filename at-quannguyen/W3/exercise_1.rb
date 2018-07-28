def find_index(str)
  if str.is_a? String
    count = Hash.new(0)
    arr = str.split('')
    arr.each { |j| count[j] += 1 }
    not_key = count.key(1)
    return arr.index(not_key) if not_key
  else
    puts 'Input is not String !'
  end
  -1
end

puts find_index 'nguyen hoang quan'
