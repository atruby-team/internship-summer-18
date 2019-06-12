class Century
  attr_accessor :year

  def initialize year
    self.year = year
  end

  def print
    century = fnCentury
    case fnCentury
      when 0
        puts "Vui long khong de trong va so phai > 0 !"
      when 1
        puts "The Ky: #{century}"
      else
        puts "The Ky: #{century}"
      end
  end

  def fnCentury
    if year == false || year < 0
      0
    elsif year > 0 && year <= 100
      1
    else
      century =
        if year % 100 == 0
          year / 100
        else
          (year / 100.0).to_i + 1
        end
    end
  end
end

puts "Nhap so nam : "
number = Integer(gets) rescue false
year = Century.new number
year.print
