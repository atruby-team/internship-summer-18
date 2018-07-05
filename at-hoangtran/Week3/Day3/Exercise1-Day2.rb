puts 'Input:'
loop do
  a = Float(gets.chomp)
  break if a < 0 || a > 10
  case a
  when a >= 9
    puts 'A'
  when a >= 8
    puts 'B'
  when a >= 7
    puts 'C'
  when a >= 6
    puts 'D'
  else
    puts 'F'
  end
  break
end
