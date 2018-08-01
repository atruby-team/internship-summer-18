Dir['../model/*.rb'].each { |file| require file }
require 'pry'

class NotificationController
  def get_items(id_team)
    Notification.get_all_notify(id_team)
  end

  def get_item(id, employee)
    notify = Notification.get_notify(id)
    notify if notify['id_team'] == employee['team']
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
