class LeaveModel
  attr_accessor :leave_id, :employee_id, :reason, :total_date_off, :status, :publish_date
  def initialize
    @leave_id = leave_id
    @employee_id = employee_id
    @reason = reason
    @total_date_off = total_date_off
    @status = status
    @publish_date = publish_date
  end
end
