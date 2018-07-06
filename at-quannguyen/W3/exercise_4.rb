class StringFormat
  class << self
    def human_name name
      name.is_a?(String) ? name : nil
    end

    def format_name name
      StringFormat.human_name(name) ?
        name.gsub("_", "").split.map(&:capitalize).join(' ') : nil
    end

    def uniq string
      StringFormat.human_name(string) ? string.chars.uniq.join("") : nil
    end

    def only_letters? string
      StringFormat.human_name(string) ? !!string.match(/\A[a-zA-Z]*\z/) : nil
    end
  end
end

puts StringFormat.format_name "kaylene _johnson"
puts StringFormat.uniq "Hello world!!!"
puts StringFormat.only_letters? "abc"
