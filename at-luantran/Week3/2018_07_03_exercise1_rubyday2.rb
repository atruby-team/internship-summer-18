loop do
  puts 'Enter number:'
  x = gets.chomp.to_i
  case x
  when (9..10)
    puts 'A'
  when (8..9)
    puts 'B'
  when (7..8)
    puts 'C'
  when (6..7)
    puts 'D'
  else
    puts 'F'
  end
  break unless (0..10).member?(x)
end
