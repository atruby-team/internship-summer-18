print 'Input: '
loop do
  a = gets.to_i
  case a
  when (9..10)
    puts 'A'
    break
  when (8..9)
    puts 'B'
    break
  when 7..8
    puts 'C'
    break
  when 6..7
    puts 'D'
    break
  when 0..6
    puts 'F'
    break
  else
    p 'Please choose 0 to 10 !'
    print 'Input: '
  end
end
