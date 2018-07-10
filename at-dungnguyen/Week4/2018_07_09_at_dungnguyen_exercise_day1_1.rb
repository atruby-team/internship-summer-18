class News
  def self.update(obj, title, content)
    obj.title = title
    obj.content = content
  end

  def self.delete(obj)
    @store.each do |news|
      @store.delete(news) if news[:id] == obj.id
    end
  end

  def self.list
    @store
  end
end

class BbcNews < News
  attr_accessor :id, :title, :content, :category
  def initialize(id, title, content, category)
    @id = id
    @title = title
    @content = content
    @category = category
  end

  def self.save(obj)
    h = { id: obj.id, title: obj.title, content: obj.content, category: obj.category }
    @store ||= []
    @store.push(h)
  end
end

class CnnNews < News
  attr_accessor :id, :title, :content, :publication_date
  def initialize(id, title, content, publication_date)
    @id = id
    @title = title
    @content = content
    @publication_date = publication_date
  end

  def self.save(obj)
    h = { id: obj.id, title: obj.title, content: obj.content, publication_date: obj.publication_date }
    @store ||= []
    @store.push(h)
  end
end

class User
  attr_accessor :id, :name
  attr_reader :friends, :message
  def initialize(id, name)
    @id = id
    @name = name
    @organisation = []
    @friends = []
    @message = []
  end

  def subscribe(organisation)
    @organisation.push(organisation)
  end

  def unsubscribe(organisation)
    @organisation.delete(organisation)
  end

  def subscription_list
    p @organisation
  end

  def show_news(organisation)
    p 'No result' unless @organisation.include?(organisation)
    @organisation.each do |obj|
      p obj.list if obj == organisation
    end
  end

  def add_friend(user)
    @friends.push(user)
    user.friends.push(self)
  end

  def unfriend(user)
    @friends.delete(user)
    user.friends.delete(self)
  end

  def list_friends
    count = Hash.new(0)
    @friends.each do |fr|
      count[fr.name] += 1
      if count[fr.name] > 1
        p fr.name += "(#{fr.id})"
      else
        p fr.name
      end
    end
  end

  def send_message(friend, message)
    if @friends.include?(friend)
      h = {}
      h['id'] = self.id
      h[self.name] = message
      @message.push(h)
      friend.message.push(h)
    end
  end

  def conversation(friend)
    @message & friend.message
  end
end

bbc_news1 = BbcNews.new(1, 'BBC first news', 'Hello world from BBC', 'Say hello')
bbc_news2 = BbcNews.new(2, 'BBC second news', 'Hello Ruby from BBC', 'Say hello')
bbc_news3 = BbcNews.new(3, 'BBC third news', 'Hello AsianTech from BBC', 'Say hello')

BbcNews.save bbc_news1
BbcNews.save bbc_news2
BbcNews.save bbc_news3

cnn_news1 = CnnNews.new(1, 'CNN first news', 'Hello world from CNN', '06/07/2018')
cnn_news2 = CnnNews.new(2, 'CNN second news', 'Hello Ruby from CNN', '06/07/2018')
cnn_news3 = CnnNews.new(3, 'CNN third news', 'Hello AsianTech from CNN', '06/07/2018')

CnnNews.save cnn_news1
CnnNews.save cnn_news2
CnnNews.save cnn_news3

BbcNews.update(bbc_news2, 'BBC second news!', 'Hello Ruby from Asiantech')
BbcNews.delete(bbc_news1)

CnnNews.update(cnn_news2, 'CNN second news!', 'Hello Ruby from Asiantech')
CnnNews.delete(cnn_news3)

first_user = User.new(1, 'Bob')
second_user = User.new(2, 'Smith')
third_user = User.new(3, 'Bob')

first_user.subscribe(BbcNews)
second_user.subscribe(CnnNews)
third_user.subscribe(CnnNews)
third_user.subscribe(BbcNews)

second_user.unsubscribe(CnnNews)

first_user.subscription_list
second_user.subscription_list
third_user.subscription_list

first_user.show_news(BbcNews)
first_user.show_news(CnnNews)
third_user.show_news(CnnNews)

first_user.add_friend(second_user)
first_user.add_friend(third_user)
second_user.add_friend(third_user)

third_user.unfriend(first_user)

first_user.list_friends
second_user.list_friends
third_user.list_friends

first_user.send_message(second_user, 'Hello!')
second_user.send_message(first_user, "Hi! what's up?")
first_user.send_message(second_user, 'I just came to say hello.')
second_user.send_message(first_user, '...')

p second_user.conversation(first_user)

first_user.send_message(third_user, 'Hello!')
first_user.send_message(third_user, 'I just came to say hello.')

p first_user.conversation(third_user)
p third_user.conversation(first_user)
