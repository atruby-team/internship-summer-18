require './models/leave'
require './models/employee'
require 'pry'
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
    @arr_id = []
    system('clear')
    p '============== List Leave Request =================='
    result = if user.role == 'team_lead'
               Leave.new.get_list_lead(user.id_team, status)
             else
               Leave.new.get_list_employee(user.id, status)
             end
    result.each do |x|
      p "#{x['leave_id']}. #{x['name']} : #{x['reason']}"
      @arr_id.push(x['leave_id'])
    end
  end

  def approve(user)
    id_request = 0
    return 'No request' if show(user, 'sending').empty?
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if @arr_id.include? id_request
    end
    request = Leave.new.get_item(id_request).first
    p 'Choose 1 -> approve or 2 -> reject'
    i = gets.chomp.to_i
    case i
    when 1
      Leave.new.reponse_approve(id_request)
      Employee.new.update_balance(user.id, request['total_day_off'])
      'Leader approve request'
    when 2
      Leave.new.reponse_reject(id_request)
      'Leader reject request'
    end
  end

  def update(user)
    id_request = 0
    return 'No request' if show(user, 'rejected').empty?
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if @arr_id.include? id_request
    end
    p '============ Update Request ==========='
    p 'Enter reason:'
    reason = gets.chomp
    Leave.new.update_request(reason, id_request)
    'Update success'
  end

  def delete(user)
    id_request = 0
    return 'No request' if show(user, 'rejected').empty?
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if @arr_id.include? id_request
    end
    Leave.new.delete_request(id_request)
    'Delete success'
  end

  def list_of_leaves(user)
    return 'No request' if show(user, 'approved').empty?
    show(user, 'approved')
  end
end
