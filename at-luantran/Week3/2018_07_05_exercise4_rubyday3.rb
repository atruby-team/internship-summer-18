class StringFormat
  class << self
  def human_name(string)
    if string.is_a? String
      i = 0
      out = ''
      string.strip!
      string.gsub!(/[^A-Za-z ]/, '')
      string.each_char do |x|
        if string[i - 1] == ' ' && x != ' ' || i.zero?
          _a = x.ord - 32
          out += _a.chr
        else
          out += x unless string[i - 1] == ' ' && x == ' '
        end
        i += 1
      end
      out
    else
      nil
    end
  end

  def uniq(string)
    hash = {}
    string.each_char { |_str| hash[_str] = ((hash[_str] || 0) + 1) }
    hash.keys.inject { |out, i| out + i }
  end

  def only_letter?(string)
    if string.is_a? String
      string == string.gsub(/[^a-zA-Z]/, '')
    else
      nil
    end
  end
  end
end

puts StringFormat.human_name 'kaylene _johnson'
puts StringFormat.human_name 'kaylene -  -_  _ _johnson'
puts StringFormat.uniq 'Hello word'
puts StringFormat.only_letter? 'Hello'
