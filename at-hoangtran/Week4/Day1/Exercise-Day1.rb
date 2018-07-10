class News
  attr_accessor :id, :title, :content
  def self.update(news, title, content)
    news.title = title
    news.content = content
  end

  def self.delete(news)
    @list_news.delete(news)
  end
end

class BbcNews < News
  attr_accessor :category
  @list_news = []
  def initialize(id, title, content, category)
    @id = id
    @title = title
    @content = content
    @category = category
  end

  def self.add(news)
    h = {}
    h[@id] = [@title, @content, @category]
    @list_news.push(h)
  end
end

class CnnNews < News
  attr_accessor :publication_date
  @list_news = []
  def initialize(id, title, content, publication_date)
    @id = id
    @title = title
    @content = content
    @publication_date = publication_date
  end

  def self.add(news)
    h = {}
    h[@id] = [@title, @content, @publication_date]
    @list_news.push(h)
  end
end

class User
  attr_accessor :id, :name, :message, :friends, :subcription_list
  def initialize(id, name)
    @id = id
    @name = name
    @message = []
    @friends = []
    @subscription_list = []
    @list_friends = {}
  end

  def subscribe(organisation)
    @subcription_list.push(organisation)
  end

  def unsubscribe(organisation)
    if @subcription_list.include?(organisation)
      @subcription_list.delete(organisation)
    else
      false
    end
  end

  def add_friends(user)
    @friends.push(user)
    user.friends.push(self)
  end

  def unfriend(user)
    @friends.delete(user)
    user.friends.delete(self)
  end

  def list_friends
    @friends.each do |friend|
      @list_friends[friend.name] += 1
      if @list_friends[friend.name] > 1
        p friend.name += friend.id.to_s
      else
        p friend.name
      end
    end
  end

  def shows_news(organisation)
    if @organisation.include?(organisation)
      @organisation.each do |x|
        puts x.list if x == organisation
      end
    else
      nil
    end
  end

  def send_messages(friend, message)
    return unless @friends.include?(friend)
    h = {}
    h['id'] = self.id
    h[self.name] = message
    @message.push(h)
    friend.message.push(h)
  end

  def conversation(friend)
    @message & friend.message
  end
end

bbc_news01 = BbcNews.new(0o1, 'BBC first news', 'Hello world from BBC', 'Say hello')
BbcNews.add(bbc_news01)
bbc_news02 = BbcNews.new(0o2, 'BBC second news', 'Hello Ruby from BBC', 'Say hello')
BbcNews.add(bbc_news02)
bbc_news03 = BbcNews.new(0o2, 'BBC third news', 'Hello AsianTech from BBC', 'Say hello')
BbcNews.add(bbc_news03)

cnn_news01 = CnnNews.new(0o1, 'CNN first news', 'Hello world from CNN', '06/07/2018')
CnnNews.add(cnn_news01)
cnn_news02 = CnnNews.new(0o2, 'CNN second news', 'Hello Ruby from CNN', '06/07/2018')
CnnNews.add(cnn_news02)
cnn_news03 = CnnNews.new(0o3, 'CNN third news', 'Hello AsianTech from CNN', '06/07/2018')
CnnNews.add(cnn_news03)

BbcNews.update(bbc_news02, 'BBC second news!', 'Hello Ruby from Asiantech')
BbcNews.delete(bbc_news01)

CnnNews.update(cnn_news02, 'CNN second news!', 'Hello Ruby from Asiantech')
CnnNews.delete(cnn_news03)

first_user = User.new(0o1, 'Bob')
second_user = User.new(0o2, 'Smith')
third_user = User.new(0o3, 'Bob')

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

first_user.friends
second_user.friends
third_user.friends

first_user.send_message(second_user, 'Hello!')
second_user.send_message(first_user, 'Hi! whats up?')
first_user.send_message(second_user, 'I just came to say hello.')
second_user.send_message(first_user, '...')

second_user.conversation(first_user)

first_user.send_message(third_user, 'Hello!')
first_user.send_message(third_user, 'I just came to say hello.')

first_user.conversation(third_user)
third_user.conversation(first_user)
