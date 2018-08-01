class Leave
  attr_accessor :id, :user, :reason, :total_date_off, :status, :publish_date
  def initialize(id, user, reason, total_date_off, status, publish_date)
    self.id = id
    self.user = user
    self.reason = reason
    self.total_date_off = total_date_off
    self.status = status
    self.publish_date = publish_date
  end
end
