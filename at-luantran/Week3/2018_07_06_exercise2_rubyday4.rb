class Dictionary
  attr_accessor :vocab_desc
  def initialize
    @vocab_desc = []
    @vocabs = []
  end

  def add(vocab, desc)
    return false if @vocabs.include? vocab
    @vocab_desc.push(vocab => [desc, 0])
    @vocabs.push(vocab)
    true
  end

  def lookup(vocab)
    return false unless @vocabs.include? vocab
    @vocab_desc.each do |x|
      index = x.keys.index(vocab)
      if index
        x.values[0][1] += 1
        return x.values[0][0]
      end
    end
  end

  def size
    @vocab_desc.size
  end

  def remove(vocab)
    return false unless @vocabs.include? vocab
    @vocab_desc.delete_if { |x| x.keys.first == vocab }
    @vocabs.delete(vocab)
    true
  end

  def pop
    @vocab_desc.pop
  end

  def random
    index_random = Random.new.rand(0..@vocab_desc.length - 1)
    @vocab_desc[index_random]
  end

  def update(vocab, desc)
    return false unless @vocabs.include? vocab
    remove(vocab)
    add(vocab, desc)
  end

  def favorite
    arr_lookup = @vocab_desc.map { |x| x.values[0][1] }
    @vocab_desc[arr_lookup.find_index(arr_lookup.max)]
  end
end

dict = Dictionary.new
p dict.add('Hello', 'Xin chào')
p dict.add('Goodbye', 'Tạm biệt')
p dict.add('Hello', 'Xin chào')
p dict.add('Goodbye', 'Chào tạm biệt')
p dict.lookup('Goodbye')
p dict.add('Love', 'Tình yêu')
p dict.size
p dict.remove('Love')
p dict.remove('Love')
p dict.favorite
p dict.add('Love', 'Tình yêu')
p dict.update('Goodbye', 'Chào tạm biệt')
p dict.lookup('Goodbye')
p dict.pop
p dict.favorite
p dict.random
p dict.pop
p dict.pop
p dict.pop
p dict.size
