require 'time'
# class dictionary
class Dictionary
  def initialize
    @list_dictionary = {}
    @id = 1
  end

  def add(dict, des)
    if Dictionary.check_empty_by_vocab(@list_dictionary, dict)
      @list_dictionary[@id] =
        { dict: dict, des: des, lookup: 0, history_lookup: 0 }
      @id += 1
      return true
    end
    false
  end

  def lookup(vocab)
    result = Dictionary.find_dict_by_vocab(@list_dictionary, vocab)
    if result
      sleep 0.5
      result[1][:lookup] += 1
      result[1][:history_lookup] = Time.new.strftime('%m/%d/%Y %H:%M:%S')
      return result[1][:des]
    end
    nil
  end

  def size
    @list_dictionary.length
  end

  def remove(vocab)
    result = Dictionary.find_dict_by_vocab(@list_dictionary, vocab)
    check = result ? result[0] : nil
    @list_dictionary.delete(check) ? true : false
  end

  def pop
    @list_dictionary.delete(@list_dictionary.keys.max)
  end

  def update(vocab, desc)
    unless Dictionary.check_empty_by_vocab(@list_dictionary, vocab)
      result = Dictionary.find_dict_by_vocab(@list_dictionary, vocab)
      @list_dictionary.delete(result[0])
      return add(vocab, desc)
    end
    false
  end

  def random
    keys = @list_dictionary.keys
    key_rand = keys[rand(keys.size)]
    result = @list_dictionary[key_rand]
    { result[:dict] => result[:des] }
  end

  def favorite
    arr = []
    result = nil
    lookup = @list_dictionary.values.map { |e| e[:lookup] }
    ck_favorite(arr, lookup, result)
  end

  def ck_favorite(arr, lookup, result)
    unless lookup.max.zero?
      @list_dictionary.values.each { |e| arr << e if e[:lookup] == lookup.max }
      if arr.length > 1
        nummin = arr.map { |e| Time.parse(e[:history_lookup]) }.min
        result = arr.select { |e| Time.parse(e[:history_lookup]) == nummin }[0]
      else
        result = arr[0]
      end
      return { result[:dict] => result[:des] }
    end
  end

  class << self
    def find_dict_by_vocab(list, dict)
      list.find { |_key, value| value[:dict].include? dict }
    end

    def check_empty_by_vocab(list, dict)
      list.find { |_key, value| value[:dict].include? dict }.nil?
    end
  end
end

dict = Dictionary.new
dict.add('Hello', 'Xin chào')
dict.add('Goodbye', 'Tạm biệt')
dict.add('Hello', 'Xin chào')
dict.add('Goodbye', 'Chào tạm biệt')
dict.lookup('Goodbye')
dict.add('Love', 'Tình yêu')
dict.size
dict.remove('Love')
dict.remove('Love')
dict.favorite
dict.add('Love', 'Tình yêu')
dict.update('Goodbye', 'Chào tạm biệt')
dict.lookup('Goodbye')
dict.pop
dict.favorite
dict.random
dict.pop
dict.pop
dict.pop
dict.size
