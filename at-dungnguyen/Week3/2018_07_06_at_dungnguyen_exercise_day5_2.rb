class Dictionary
  def initialize
    @dict = []
    @keys = []
    @count = {}
  end

  def add(vocab, desc)
    h = {}
    unless @keys.include?(vocab)
      h[vocab] = desc
      @keys.push(vocab)
      @dict.push(h)
    end
  end

  def update(vocab, desc)
    id = @dict.index { |dict| dict.key?(vocab) }
    @dict.delete_at(id)
    @keys.delete(vocab)
    add(vocab, desc)
  end

  def show
    @dict
  end

  def pop
    temp = @keys.last
    @keys.pop
    @dict.pop
    @count[temp]
  end

  def size
    @dict.size
  end

  def random
    @dict.sample
  end

  def lookup(vocab)
    @dict.each do |dict|
      next unless dict.key?(vocab)
      if @count[vocab]
        @count[vocab] += 1
      else
        @count[vocab] = 1
      end
      return dict[vocab]
    end
    'No result'
  end

  def favorite
    arr = @count.max_by { |_k, v| v }
    @dict.each do |dict|
      return dict if dict.key?(arr.first)
    end
  end

  def remove(vocab)
    @dict.delete(vocab)
    @keys.delete(vocab)
  end
end

dict = Dictionary.new
dict.add('Hello', 'Xin chào')
dict.add('Goodbye', 'Tạm biệt')
dict.add('Hello', 'Xin chào')
dict.add('Goodbye', 'Chào tạm biệt')
puts dict.lookup('Goodbye')
dict.add('Love', 'Tình yêu')
puts dict.size
dict.remove('Love')
puts dict.favorite
dict.add('Love', 'Tình yêu')
dict.update('Goodbye', 'Chào tạm biệt')
puts dict.lookup('Goodbye')
dict.pop
dict.favorite
dict.random
dict.pop
dict.pop
dict.pop
puts dict.size
