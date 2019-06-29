require_relative '../config/db'
class LeaveController
  def initialize
    @db = Db.new
    @connect = @db.connect
    @db.select_db
  end

  def request(obj)
    statement = @connect.prepare('INSERT INTO leaves (team_id, employee_id, reason, total_date_off, status, publish_date) VALUES (?, ?, ?, ?, ?, ?)')
    !statement.execute(obj.team_id, obj.employee_id, obj.reason, obj.total_date_off, obj.status, obj.publish_date)
  end

  def approve(obj)
    statement = @connect.prepare('UPDATE leaves SET status = ? WHERE id = ? AND team_id = ?')
    !statement.execute(obj.status, obj.id, obj.team_id)
  end

  def update(obj)
    statement = @connect.prepare('UPDATE leaves SET reason = ?, total_date_off = ?, status = ? WHERE id = ? AND team_id = ? AND employee_id = ?')
    !statement.execute(obj.reason, obj.total_date_off, obj.status, obj.id, obj.team_id, obj.employee_id)
  end

  def delete(obj)
    statement = @connect.prepare('DELETE FROM leaves WHERE id = ? AND team_id = ? AND employee_id = ?')
    !statement.execute(obj.id, obj.team_id, obj.employee_id)
  end

  def show_leaves(status)
    @connect.query("SELECT * FROM leaves WHERE status = #{status}")
  end

  def list_of_leaves; end
end
