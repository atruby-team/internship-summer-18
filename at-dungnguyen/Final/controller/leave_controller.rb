Dir['../model/*.rb'].each { |file| require file }
require 'pry'

class LeaveController
  def add_item(request)
    employee = Employee.find_employee(request.id_user)
    if employee['leave_balance'] > request.total_date_off
      return true if Leave.add_request(request)
    end
    false
  end

  def del_item(id, user)
    leave = Leave.find_request(id)
    if leave['status'] == 2 && user['id'] == leave['id_user']
      return true if Leave.delete_request(id) > 0
    end
    false
  end

  def all_approved
    Leave.all_approved_request
  end

  def need_approve
    Leave.all_need_approve
  end

  def update_leave(id, request, user)
    leave = Leave.find_request(id)
    if leave['status'] == 2 && user['id'] == leave['id_user']
      return true if Leave.update_request(id, request)
    end
    false
  end

  # approve or reject
  def update_status(id, status)
    leave = Leave.find_request(id)
    if leave['status'].zero?
      return true if Leave.update_status(id, status) > 0
    end
    false
  end
end
