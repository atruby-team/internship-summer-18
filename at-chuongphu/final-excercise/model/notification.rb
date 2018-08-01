class Notification
  attr_accessor :id, :title, :content, :publish_date
  def initialize(id, title, content, publish_date)
    self.id = id
    self.title = title
    self.content = content
    self.publish_date = publish_date
  end
end
