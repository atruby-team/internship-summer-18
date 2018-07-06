class StringFomat
  def human_name(name)
    return unless name.is_a?(String)
    @name = name
    str = []
    @name.strip!
    arr = @name.split(' ')
    arr.each do |x|
      x.gsub!(/[^a-zA-Z]/, '')
      if only_letters?(x)
        x.capitalize!
        str.push(x)
      end
    end
    str.join(' ')
  end

  def uniq(name)
    arr = name.split('')
    arr.uniq.join('')
  end

  def only_letters?(name)
    name[/[a-zA-Z]+/] == name if name.is_a?(String)
  end
end

name = StringFomat.new
p name.uniq('Hello World')
p name.human_name('nha@n truon_g')
p name.human_name('kaylene _johnson')
