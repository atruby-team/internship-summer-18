require './models/leave'
require './models/employee'

class LeaveController
  def self.request(user)
    system('clear')
    p '========= Create Leave Request ========='
    balance = user.leave_balance
    p 'Enter reason:'
    reason = gets.chomp
    p 'Enter total date of:'
    total = gets.chomp.to_i
    return false if balance < total
    Leave.new.add_request(reason, total, user.id)
    true
  end

  def show(user, status)
    id_request = 0
    arr_id = []
    system('clear')
    p '============== List Leave Request =================='
    result = if user.role == 'team_lead'
               Leave.new.get_list_lead(user.id_team, 'status')
             else
               Leave.new.get_list_employee(user.id, 'status')
             end
    result.each do |x|
      p "#{x['id']}. #{x['name']} : #{x['reason']} "
      arr_id .push(x['id'])
    end
  end

  def self.approve(user)
    show(user, 'sending')
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if arr_id.include? id_request
    end
    request = Leave.get_item(id_request).first
    p 'Choose 1 -> approve or 2 -> reject'
    i = gets.chomp.to_i
    case i
    when 1
      Leave.new.reponse_approve(id_request)
      Employee.new.update_balance(user.id, request.total_date_off)
      p 'Leader approve request'
    when 2
      Leave.new.reponse_reject(id_request)
      p 'Leader reject request'
    end
  end

  def self.update(user)
    show(user, 'rejected')
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if arr_id.include? id_request
    end
    p '============ Update Request ==========='
    p 'Enter reason:'
    reason = gets.chomp
    Leave.new.update_request(reason, id_request)
  end

  def delete(user)
    show(user, 'rejected')
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if arr_id.include? id_request
    end
    Leave.new.delete_request(id_request)
  end

  def list_of_leaves(user)
    show(user, 'approved')
  end
end
