class News
  attr_accessor :id, :title, :content
  def self.update(news, title, content)
    news.title = title
    news.content = content
  end
  def self.delete(news)
    @arr.delete(news)
  end
  
end
class BbcNews < News
  attr_accessor :category
  @arr = []
  def initialize(id, title, content, category)
    @id = id
    @title = title
    @content = content
    @category = category
  end
  def self.news(news)
    @arr.push(news)
  end
  def self.show
    arr_show = []
    @arr.each do |x|
      hash = {}
      hash[x.id] = [x.title, x.content, x.category]
      # title = x.title
      # content = x.content
      # category = x.category
      # hash[title] = x.title
      # hash[content] = x.content
      # hash[category] = x.category
      arr_show.push(hash)
    end
    arr_show  
  end  
end
class CnnNews
  attr_accessor :publication_date
  @arr = []
  def initialize(id, title, content, publication_date)
    @id = id
    @title = title
    @content = content
    @publication_date = publication_date
  end
  def self.news(news)
    @arr.push(news)
  end  
  def self.show
    arr_show = []
    @arr.each do |x|
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
  attr_accessor :id, :name, :friends, :messages
end
bbc_new_01 = BbcNews.new(01,'Con ngu','con du','con cho')
BbcNews.news(bbc_new_01)
bbc_new_02 = BbcNews.new(02,'Con bo','Con Trau','Con Muoi')
BbcNews.news(bbc_new_02)
BbcNews.update(bbc_new_01,'Con Heo','Con ho')
BbcNews.delete(bbc_new_02)
print bbc_new_01 = BbcNews.show