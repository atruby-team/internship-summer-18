class Loop
  def exercise_1
    loop do
      puts 'Vui long nhap :'
      input_keyboard
      break unless (0..10).cover? @input
    end

    if @input >= 9
      puts 'A'
    elsif @input >= 8
      puts 'B'
    elsif @input >= 7
      puts 'C'
    elsif @input <= 6
      puts 'F'
    end
  end

  def exercise_2
    arr = array_by_input
    arr.map! { |e| e.even? ? 'even' : 'odd' }
    puts "Boolean : #{arr}"
  end

  def exercise_3
    nums = array_by_input
    nums.sort!
    n = nums.length
    s = nums[n - 1] * nums[n - 2] * nums[n - 3]
    s = [s, nums[n - 1] * nums[1] * nums[0]].max
    puts "Output : #{s}"
  end

  def exercise_4
    nums = array_by_input
    nums.uniq! ? true : false
  end

  def exercise_5
    nums = array_by_input
    nums.each_with_object(Hash.new(0)) { |e, total| total[e] += 1; }
  end

  def exercise_6(ctrl)
    case ctrl
    when 1
      nums = array_by_input
      total = nums.inject(0, :+)
      puts "Result : #{total}"
    when 2
      arr = []
      0.upto(1000) do |n|
        arr << n
      end
      result = arr.select { |e| (e % 15).zero? }
      puts "Result : #{result}"
    when 3
      arr = [1, 2, 3, 4, 5, 6]
      arr.delete_if(&:odd?)
      puts "Result : #{arr}"
    when 4
      obj = [{ Bob: 7 }, { Smith: 8 }, { Kate: 9 }]
      result = obj.select { |item| item.values[0] >= 8 }
      puts "Result : #{result}"
    end
  end

  def array_by_input
    puts 'Vui nhap n :'
    input_keyboard
    arr = []
    @input.each_with_index do |_e, index|
      puts "Vui long nhap phan tu #{index}:"
      input_keyboard
      arr << @input
    end
    arr
  end

  def input_keyboard
    loop do
      @input = begin
                 Integer(gets)
               rescue StandardError
                 false
               end
      break unless @input == false
    end
  end
end

var = Loop.new
var.exercise_1 # demo , change fn 'exercise_`1 to 6`'
