require './bbcnews.rb'
require './cnnnews.rb'
require './user.rb'

bbc_news_1 = BbcNews.new(1, 'BBC first news', 'Hello world from BBC', 'Say hello')
bbc_news_2 = BbcNews.new(2, 'BBC second news', 'Hello Ruby from BBC', 'Say hello')
bbc_news_3 = BbcNews.new(3, 'BBC third news', 'Hello AsianTech from BBC', 'Say hello')

cnn_news_1 = CnnNews.new(1, 'CNN first news', 'Hello world from CNN', '06/07/2018')
cnn_news_2 = CnnNews.new(2, 'CNN second news', 'Hello Ruby from CNN', '06/07/2018')
cnn_news_3 = CnnNews.new(3, 'CNN third news', 'Hello AsianTech from CNN', '06/07/2018')

BbcNews.update(bbc_news_2, 'BBC second news!', 'Hello Ruby from Asiantech')
BbcNews.delete(bbc_news_1)

CnnNews.update(cnn_news_2, 'CNN second news!', 'Hello Ruby from Asiantech')
CnnNews.delete(cnn_news_3)

first_user = User.new(1, 'Bob')
second_user = User.new(2, 'Smith')
third_user = User.new(3, 'Bob')

first_user.subscribe(BbcNews)
second_user.subscribe(CnnNews)
third_user.subscribe(CnnNews)
third_user.subscribe(BbcNews)

second_user.unsubscribe(CnnNews)

first_user.subscription_list # [BbcNews]
second_user.subscription_list # []
third_user.subscription_list # [CnnNews, BbcNews]

first_user.show_news(BbcNews)
first_user.show_news(CnnNews)
third_user.show_news(CnnNews)

first_user.add_friend(second_user)
first_user.add_friend(third_user)
second_user.add_friend(third_user)

third_user.unfriend(first_user)

first_user.friends # [‘Smith’]
second_user.friends # [‘Bob(01)’, ‘Bob(03)’]
third_user.friends # [‘Smith’]

first_user.send_message(second_user, 'Hello!')
second_user.send_message(first_user, 'Hi! what’s up?')
first_user.send_message(second_user, 'I just came to say hello.')
second_user.send_message(first_user, '...')

second_user.conversation(first_user)

first_user.send_message(third_user, 'Hello!')
first_user.send_message(third_user, 'I just came to say hello.')

first_user.conversation(third_user) # []
third_user.conversation(first_user) # []
