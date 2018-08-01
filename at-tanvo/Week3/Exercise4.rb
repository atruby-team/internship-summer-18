class StringFormat
  def human_name(name)
    if name.is_a?(String)
      @name = name
      name_format
    end
  end

  def name_format
    @name = @name.split(' ').each do |n|
      n.gsub!(/[^a-zA-Z]/, '')
      n.capitalize! if only_letter?(n)
    end
    @name = @name.join(' ')
  end

  def uniq(name)
    arr = name.split('')
    arr.uniq.join('')
  end

  def only_letter?(name)
    name[/[^a-zA-Z]+/] == name if name.is_a?(String)
  end
end
name = StringFormat.new
puts name.human_name('Dang ____Tan')
puts name.uniq('Hello Woorld')
