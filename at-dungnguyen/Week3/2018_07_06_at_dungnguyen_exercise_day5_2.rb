class Dictionary
  def initialize
    @dict = []
    @keys = []
    @count = {}
  end

  def add(vocab, desc)
    return if @keys.include?(vocab)
    @keys.push(vocab)
    @dict.push(vocab => desc)
  end

  def update(vocab, desc)
    remove(vocab)
    add(vocab, desc)
  end

  def show
    @dict
  end

  def pop
    temp = @keys.last
    @count[temp]
    @keys.pop
    @dict.pop
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
    id = @dict.index { |dict| dict.key?(vocab) }
    @dict.delete_at(id)
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
puts dict.pop
dict.favorite
dict.random
puts dict.pop
puts dict.pop
puts dict.pop
puts dict.size
