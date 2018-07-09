class Dictionary
  def initialize
    @dict = []
    @word = []
    @count = {}
  end

  def add(vocal, descr)
    temp = {}
    unless @dict.include?(vocal)
      temp[vocal] = descr
      @word.push(vocal)
      @dict.push(temp)
    end
  end

  def show
    @dict
  end

  def look_up(vocal)
    @dict.each do |n|
      next unless n.key?(vocal)
      @count[vocal] ? @count[vocal] += 1 : @count[vocal] = 1
      return n[vocal]
    end
    'khong co ket qua'
  end

  def pop
    temp = @word.last
    @count[temp]
    @word.pop
    @dict.pop
  end

  def remove(vocal)
    id = @dict.index { |dict| dict.key?(vocal) }
    @dict.delete_at(id)
    @word.delete(vocal)
  end

  def size
    @dict.size
  end

  def update(vocal, descr)
    if @dict.key?(vocal)
      remove(vocal)
      add(vocal, descr)
    end
  end

  def random
    @dict.sample
  end

  def favorite
    array = @count.max_by { |_k, v| v }
    @dict.each do |n|
      return n if n.key?(array.first)
    end
  end
end

dic = Dictionary.new
dic.add('Hi', 'Xin Chao')
dic.add('go', 'di')
dic.add('gender', 'Gioi tinh')
dic.add('team', 'doi')
dic.add('party', 'Buoi tiec')
dic.add('truck', 'xe tai')
dic.add('end', 'het')
dic.add('over', 'ket thuc')
puts dic.size
puts dic.show
dic.look_up('go')
p dic.look_up('go')
dic.pop
p dic.show
p dic.favorite
p dic.random

