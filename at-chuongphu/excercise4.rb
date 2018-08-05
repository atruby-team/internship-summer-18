# ex1
def non_repeat(str)
  hash = Hash.new (0)
  arr = str.split('')
  arr.each { |alpha| hash[alpha] += 1 }
  num = hash.key(1)
  num ? str.index(num) : -1 
end
puts non_repeat('asiantech')

# ex2
class Array
  def sum_arr
    self.inject { |sum, a| sum + a }
  end
end
p [1, 2, 4, 5].sum

# ex4
class StringFormat
  def human_name(str)
    return unless str.is_a?(String)
    @str = str
    str = []
    @str.strip!
    arr = @str.split(' ')
    arr.each do |i|
      i.gsub!(/[^a-zA-Z]/, '')
      if only_letter?(i)
        i.capitalize!
        str.push(i)
      end
    end
    str.join('')
  end

  def uniq(str)
    arr = str.split('')
    arr.uniq.join('')
  end

  def only_letter?(str)
    str[/[a-zA-Z]+/] == str if str.is_a?(String)
  end
end

str = StringFormat.new
p str.human_name('kayle _johnson')
