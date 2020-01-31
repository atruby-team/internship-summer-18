require './models/notification'
class NotificationController
  def self.send(user)
    system('clear')
    p '=========Create Notification========='
    p 'Enter title:'
    title = gets.chomp
    p 'Enter content:'
    content = gets.chomp
    Notification.new.add_notif(title, content, user.id_team)
  end

  def self.read(user)
    id_notifi = 0
    arr_id = []
    system('clear')
    p '============== List Notification =================='
    result = Notification.new.get_list(user.id_team)
    result.each do |x|
      p "#{x['id']}. #{x['title']}"
      arr_id .push(x['id'])
    end
    loop do
      p 'Choose notification:'
      id_notifi = gets.chomp.to_i
      break if arr_id.include? id_notifi
    end
    notifi = Notification.new.get_item(id_notifi).first
    p 'Title:'
    p notifi['title']
    p 'Content:'
    p notifi['content']
  end

  def self.delete(user)
    id_notifi = 0
    arr_id = []
    system('clear')
    p '============== List Notification =================='
    result = Notification.new.get_list(user.id_team)
    result.each do |x|
      p "#{x['id']}. #{x['title']}"
      arr_id .push(x['id'])
    end
    loop do
      p 'Choose notification:'
      id_notifi = gets.chomp.to_i
      break if arr_id.include? id_notifi
    end
    Notification.new.delete(id_notifi)
  end
end
