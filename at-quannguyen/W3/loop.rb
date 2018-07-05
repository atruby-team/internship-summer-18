class Loop
  def exercise_1
    begin
      puts "Vui long nhap :"
      input_keyboard
    end until (0..10).cover? @input

    case
    when @input >= 9
      puts "A"
    when @input >= 8
      puts "B"
    when @input >= 7
      puts "C"
    when @input <= 6
      puts "F"
    end
  end

  def exercise_2
    arr = array_by_input
    arr.map! { |e| e.even? ? "even" : "odd" }
    puts "Boolean : #{arr}"
  end

  def exercise_3
    nums = array_by_input
    nums.sort!
    n = nums.length
    s = nums[n-1] * nums[n-2] * nums[n-3]
    s = [s, nums[n-1] * nums[n-2] * nums[0]].max
    s = [s, nums[n-1] * nums[1] * nums[0]].max
    s = [s, nums[2] * nums[1] * nums[0]].max
    puts "Output : #{s}"
  end

  def exercise_4
    nums = array_by_input
    nums.uniq! ? true : false
  end

  def exercise_5
    nums = array_by_input
    nums.inject(Hash.new(0)) { |total, e| total[e] += 1; total}
  end

  def exercise_6 ctrl
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
      result = arr.select { |e| (e % 5).zero? && (e % 3).zero? }
      puts "Result : #{result}"
    when 3
      arr = [1, 2, 3, 4, 5, 6]
      arr.delete_if(&:odd?)
      puts "Result : #{arr}"
    when 4
      obj = [{ Bob: 7 }, { Smith: 8 }, { Kate: 9 }];
      result = obj.select { |item| item.values[0] >= 8 }
      puts "Result : #{result}"
    end
  end

  def array_by_input
    puts "Vui nhap n :"
    input_keyboard
    arr = []
    for i in 0...@input
      puts "Vui long nhap phan tu #{i}:"
      input_keyboard
      arr << @input
    end
    arr
  end

  def input_keyboard
    begin
      @input = Integer(gets) rescue false
    end while @input === false
  end
end

var = Loop.new
var.exercise_1 # demo , change fn 'exercise_`1 to 6`'
