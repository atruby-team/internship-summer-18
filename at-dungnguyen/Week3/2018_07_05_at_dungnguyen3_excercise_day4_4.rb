class StringFormat
  def human_name(str)
    if str.is_a?(String)
      @str = str
      name_format
    end
  end

  def name_format
    str = []
    @str.strip!
    arr = @str.split(' ')
    arr.each do |s|
      s.gsub!(/[^a-zA-Z]/, '')
      if only_letter?(s)
        s.capitalize!
        str << s
      end
    end
    str.join(' ')
  end

  def uniq(str)
    arr = str.split('')
    arr.uniq.join('')
  end

  def only_letter?(str)
    str[/[a-zA-Z]+/] == str if str.is_a?(String)
  end
end

b = StringFormat.new
puts b.human_name('quang _ _ _ _dung')
puts b.uniq('Hello world!!!')
