class News
  attr_accessor :id, :title, :content
  def self.update(news, title, content)
    news.title = title
    news.content = content
  end

  def self.delete(news)
    @arr_news.delete(news)
  end
end

class BbcNews < News
  attr_accessor :category
  @arr_news = []
  def initialize(id, title, content, category)
    @id = id
    @title = title
    @content = content
    @category = category
  end

  def self.save_news(news)
    @arr_news.push(news)
  end

  def self.show_news
    arr_show = []
    @arr_news.each do |x|
      hash = {}
      title = x.title
      content = x.content
      category = x.category
      hash[title] = x.title
      hash[content] = x.content
      hash[category] = x.category
      arr_show.push(hash)
    end
    arr_show
  end
end

class CnnNews < News
  attr_accessor :publication_date
  @arr_news = []
  def initialize(id, title, content, publication_date)
    @id = id
    @title = title
    @content = content
    @publication_date = publication_date
  end

  def self.save_news(news)
    @arr_news.push(news)
  end

  def self.show_news
    arr_show = []
    @arr_news.each do |x|
      hash = {}
      title = x.title
      content = x.content
      publication_date = x.publication_date
      hash[title] = x.title
      hash[content] = x.content
      hash[publication_date] = x.publication_date
      arr_show.push(hash)
    end
    arr_show
  end
end

class User
  attr_accessor :id, :name, :message, :friends
  attr_reader :subscription_list
  def initialize(id, name)
    @id = id
    @name = name
    @friends = {}
    @message = []
    @subscription_list = []
  end

  def subscribe(organisation)
    @subscription_list.push(organisation)
  end

  def unsubscribe(organisation)
    if @subscription_list.include? organisation
      @subscription_list.delete(organisation)
    else
      false
    end
  end

  def show_news(organisation)
    if @subscription_list.include? organisation
      organisation.show_news
    else
      []
    end
  end

  def add_friend(user)
    @friends[user.id] = user.name
    user.friends[self.id] = self.name
  end

  def unfriend(user)
    @friends.delete(user.id)
    user.friends.delete(self.id)
  end

  def send_message(friend, message)
    if self.friends.value?(friend.name)
      hash = {}
      hash[friend.name] = message
      @message.push(hash)
    end
  end

  def conversation(friend)
    arr_show = []
    if self.friends.value?(friend.name)
      arr_self = self.message.select { |x| self.friends.value?(x.keys[0]) }
      arr_friend = friend.message.select { |x| friend.friends.value?(x.keys[0]) }
      arr_self.zip(arr_friend) do |mes_self, mes_friend|
        arr_show.push(mes_friend)
        arr_show.push(mes_self)
      end
      arr_show
    else
      []
    end
  end
end
bbc_news01 = BbcNews.new(1, 'BBC first news', 'Hello world from BBC', 'Say hello')
BbcNews.save_news(bbc_news01)
bbc_news02 = BbcNews.new(2, 'BBC second news', 'Hello Ruby from BBC', 'Say hello')
BbcNews.save_news(bbc_news02)
bbc_news03 = BbcNews.new(2, 'BBC third news', 'Hello AsianTech from BBC', 'Say hello')
BbcNews.save_news(bbc_news03)

cnn_news01 = CnnNews.new(1, 'CNN first news', 'Hello world from CNN', '06/07/2018')
CnnNews.save_news(cnn_news01)
cnn_news02 = CnnNews.new(2, 'CNN second news', 'Hello Ruby from CNN', '06/07/2018')
CnnNews.save_news(cnn_news02)
cnn_news03 = CnnNews.new(2, 'CNN third news', 'Hello AsianTech from CNN', '06/07/2018')
CnnNews.save_news(cnn_news03)

BbcNews.update(bbc_news02, 'BBC second news!', 'Hello Ruby from Asiantech')
BbcNews.delete(bbc_news01)

CnnNews.update(cnn_news02, 'CNN second news!', 'Hello Ruby from Asiantech')
CnnNews.delete(cnn_news03)

first_user = User.new(1, 'Bob')
second_user = User.new(2, 'Smith')
third_user = User.new(3, 'Bob')

first_user.show_news(BbcNews)
first_user.show_news(CnnNews)
third_user.show_news(CnnNews)

first_user.subscribe(BbcNews)
second_user.subscribe(CnnNews)
third_user.subscribe(CnnNews)
third_user.subscribe(BbcNews)

second_user.unsubscribe(CnnNews)

p first_user.subscription_list
p second_user.subscription_list
p third_user.subscription_list

first_user.add_friend(second_user)
first_user.add_friend(third_user)
second_user.add_friend(third_user)

third_user.unfriend(first_user)

p first_user.friends
p second_user.friends
p third_user.friends

p first_user.show_news(BbcNews)
p first_user.show_news(CnnNews)
p third_user.show_news(CnnNews)

first_user.send_message(second_user, 'Hello!')
second_user.send_message(first_user, 'Hi! what’s up?')
first_user.send_message(second_user, 'I just came to say hello.')
second_user.send_message(first_user, '...')
first_user.send_message(third_user, 'Hello!')

p second_user.conversation(first_user)

first_user.send_message(third_user, 'Hello!')
first_user.send_message(third_user, 'I just came to say hello.')

p first_user.conversation(third_user)
p third_user.conversation(first_user)
