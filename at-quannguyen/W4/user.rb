require './bbcnews.rb'
require './cnnnews.rb'
class User
  attr_accessor :id, :name
  @@list_user = {}
  @@list_friends = []
  @@list_messages = {}

  def initialize(id, name)
    self.id = id
    self.name = name
    add
  end

  def add
    unless @@list_user.key?(self.id)
      @@list_user[self.id] = { name: self.name, subscribe: [] }
      return true
    end
    false
  end

  def subscribe(obj)
    if @@list_user.key?(self.id)
      @@list_user[self.id][:subscribe] << obj
      return true
    end
    false
  end

  def unsubscribe(obj)
    if @@list_user.key?(self.id)
      @@list_user[self.id][:subscribe].delete(obj)
      return true
    end
    false
  end

  def subscription_list
    @@list_user[self.id][:subscribe]
  end

  def show_news(obj)
    result = obj.show
    result.values
  end

  def add_friend(user)
    @@list_friends << [self.id, user.id]
  end

  def unfriend(user)
    result = @@list_friends.select { |e| e[1] == self.id }
    find = result.find { |e| e[0] == user.id  }
    @@list_friends.delete(find) ? true : false
  end

  def friends
    arr = query_friends
    tmp = []
    result = arr.map { |e| @@list_user[e][:name] }
    result.each_with_index do |item, index|
      name = @@list_user[arr[index]][:name]
      tmp << (result.count(item) > 1 ? "#{name}(#{arr[index]})" : name)
    end
    tmp
  end

  def send_message(user, message)
    result = query_friends
    if result.include? user.id
      check_mes = check_message user
      if check_mes
        @@list_messages[check_mes].push(user.name => message)
      else
        @@list_messages[[self.id, user.id]] = []
        @@list_messages[[self.id, user.id]].push(user.name => message)
      end
      return true
    end
    false
  end

  def conversation(user)
    result = @@list_messages[check_message(user)]
    return result if result
    nil
  end

  def check_message(user)
    keys = @@list_messages.keys
    return [self.id, user.id] if keys.include?([self.id, user.id])
    return [user.id, self.id] if keys.include?([user.id, self.id])
    nil
  end

  def query_friends
    arr = []
    @@list_friends.each do |e|
      if e[0] == self.id
        arr << e[1]
      elsif e[1] == self.id
        arr << e[0]
      end
    end
    arr
  end
end
