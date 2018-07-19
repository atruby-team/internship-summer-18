def output(number)
  case number
  when 9..10
    puts 'A'
  when 8...9
    puts 'B'
  when 7...8
    puts 'C'
  when 6...7
    puts 'D'
  else
    puts 'F'
  end
end

loop do
  puts 'Input a number:'
  begin
    x = Float(gets)
  rescue StandardError
    puts 'Please input a number from 0 to 10'
  end

  if (0..10).cover? x
    output x
    break
  else
    puts 'Please input a number from 0 to 10'
  end
end
