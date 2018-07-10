class StringFormat
  class << self
    def human_name(name)
      name.is_a?(String) ? name : nil
    end

    def format_name(name)
      if StringFormat.human_name(name)
        str = []
        arr = name.strip.split(' ')
        arr.each do |s|
          s.gsub!(/[^a-zA-Z]/, '')
          if only_letter?(s)
            s.capitalize!
            str << s
          end
        end
        str.join(' ')
      end
    end

    def uniq(string)
      StringFormat.human_name(string) ? string.chars.uniq.join('') : nil
    end

    def only_letter?(string)
      string[/[a-zA-Z]+/] == string if StringFormat.human_name(string)
    end
  end
end

puts StringFormat.format_name 'quan _nguyen'
puts StringFormat.uniq 'Hello world!!!'
