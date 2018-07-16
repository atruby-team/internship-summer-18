require_relative '../config/db'
class NotificationController
  def initialize
    @db = Db.new
    @connect = @db.connect
    @db.select_db
  end

  def send(obj)
    statement = @connect.prepare('INSERT INTO notification (team_id, title, content, publish_date)
      VALUES (?, ?, ?, ?)')
    !statement.execute(obj.team_id, obj.title, obj.content, obj.publish_date)
  end

  def read(team_id)
    @connect.query("SELECT * FROM notification WHERE id = (SELECT MAX(id) FROM notification) AND team_id = #{team_id}")
  end

  def detele(team_id, noti_id)
    statement = @connect.prepare('DELETE FROM notification WHERE id = ? AND team_id = ?')
    !statement.execute(noti_id, team_id)
  end

  def id_by_notification(team_id)
    @connect.query("SELECT * FROM notification WHERE id = #{team_id}")
  end

  def notifications(team_id)
    @connect.query("SELECT * FROM notification where team_id = #{team_id}")
  end
end
