class Dictionary
  attr_accessor :dictionary, :vocabulary
  def initialize
    @dictionary = []
    @vocabulary = []
    @count = {}
  end

  def add(vocab, desc)
    return false if @vocabulary.include?(vocab)
    @vocabulary.push(vocab)
    @dictionary.push(vocab => desc)
  end

  def lookup(vocab)
    @dictionary.each do |dict|
      next unless dict.key?(vocab)
      @count[vocab] ? @count[vocab] += 1 : @count[vocab] = 1
      return dict[vocab]
    end
    'No result'
  end

  def size
    @dictionary.size
  end

  def random
    @dictionary.sample
  end

  def favorite
    arr = @count.max_by { |_k, v| v }
    @dictionary.each do |dict|
      return dict if dict.key?(arr.first)
    end
  end

  def remove(vocab)
    @dictionary.delete(vocab)
    @vocabulary.delete(vocab)
  end

  def pop
    temp = @vocabulary.last
    @vocabulary.pop
    @dictionary.pop
    @count[temp]
  end

  def update(vocab, desc)
    remove(vocab)
    add(vocab, desc)
  end
end

dict = Dictionary.new
dict.add('Hello', 'Xin chao')
dict.add('Goodbye', 'Tam biet')
p dict.random
p dict.size
dict.add('Love', 'Yeu')
p dict.lookup('Hello')
dict.update('Hello', 'Chao')
dict.remove('Hello')
dict.pop
print dict.dictionary
