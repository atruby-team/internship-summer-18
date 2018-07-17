loop do
  puts 'Enter number:'
  x = gets.chomp.to_i
  case x
  when (9..10)
    puts 'A'
    break
  when (8..9)
    puts 'B'
    break
  when (7..8)
    puts 'C'
    break
  when (6..7)
    puts 'D'
    break
  when (0..6)
    puts 'F'
    break
  end
end
