loop do
  puts 'Enter Number'
  a = gets.to_i
  if a >= 9 && a <= 10
    puts 'A'
    break
  elsif a >= 8 && a < 9
    puts 'B'
    break
  elsif a >= 7 && a < 8
    puts 'C'
    break
  elsif a >= 6 && a < 7
    puts 'D'
    break
  elsif a >= 0 && a < 6
    puts 'F'
    break
  elsif a < 0 && a > 10
    puts 'Sai số'
  end
end
