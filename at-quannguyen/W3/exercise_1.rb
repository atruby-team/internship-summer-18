def exist_string? string
  if string.is_a? String
    ck = string.chars.detect{ |e| string.count(e) > 1 }
    ck ? string.index(ck) : -1
  else
    puts "Input is not String !"
  end
end

puts exist_string? "asiantech"
puts exist_string? "rubyteam"

