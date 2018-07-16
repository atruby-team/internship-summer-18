Dir['../model/*.rb'].each { |file| require file }
require 'pry'

class NotificationController
  def get_items(team_id)
    Notification.get_all_notify(team_id)
  end

  def get_item(id)
    Notification.get_notify(id)
  end

  def add_item(notify)
    return true if Notification.add_notify(notify) > 0
    false
  end

  def del_item(id)
    return true if Notification.del_notify(id) > 0
    false
  end
end
