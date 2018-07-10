require './channel.rb'
class CnnNews
  include Channel
  extend Channel
  attr_accessor :id, :title, :content, :publication_date
  @@list_cnnnews = {}

  def initialize(id, title, content, publication_date)
    self.id = id
    self.title = title
    self.content = content
    self.publication_date = publication_date
    add_channel(@@list_cnnnews, id, title, content, publication_date)
  end

  def self.update(obj, title, content)
    self.update_channel(@@list_cnnnews, obj, title, content)
  end

  def self.delete(obj)
    self.delete_channel(@@list_cnnnews, obj.id)
  end

  def self.show
    @@list_cnnnews
  end
end
