require './channel.rb'
class BbcNews
  include Channel
  extend Channel
  attr_accessor :id, :title, :content, :category
  @@list_bbcnews = {}

  def initialize(id, title, content, category)
    self.id = id
    self.title = title
    self.content = content
    self.category = category
    add_channel(@@list_bbcnews, id, title, content, category)
  end

  def self.update(obj, title, content)
    self.update_channel(@@list_bbcnews, obj, title, content)
  end

  def self.delete(obj)
    self.delete_channel(@@list_bbcnews, obj.id)
  end

  def self.show
    @@list_bbcnews
  end
end
