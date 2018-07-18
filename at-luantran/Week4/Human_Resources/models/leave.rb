require 'mysql2'

class Leave
  attr_accessor :id, :user_id, :reason, :total_date_off, :status, :publish_dates
  def initialize
    @connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                                  password: 'hoichuphong513',
                                  database: 'LuanTranHumanResources')
  end

  def add_request(reason, total, user_id)
    date = DateTime.now
    d = DateTime.parse(date.to_s).to_time.strftime('%F %T')
    sql = "INSERT INTO `LuanTranHumanResources`.`leave`(id_user, reason, total_day_off, status, pulbish_date)
                        VALUES('#{user_id}', '#{reason}', #{total}, 'sending', '#{d}')"
    @connect.query(sql)
  end

  def get_list_lead(id_team, status)
    sql = "SELECT * FROM `LuanTranHumanResources`.`leave` INNER JOIN users
            ON leave.id_user = users.id WHERE id_team = #{id_team} and status = #{status}"
    @connect.query(sql)
  end

  def get_list_employee(id_user, status)
    sql = "SELECT * FROM `LuanTranHumanResources`.`leave` WHERE id_user = #{id_user} and status = #{status}"
    @connect.query(sql)
  end

  def reponse_approve(id)
    sql = "UPDATE `LuanTranHumanResources`.`leave` SET status = 'approved' WHERE id = #{id}"
    @connect.query(sql)
  end

  def reponse_reject(id)
    sql = "UPDATE `LuanTranHumanResources`.`leave` SET status = 'rejected' WHERE id = #{id}"
    @connect.query(sql)
  end

  def get_item(id)
    sql = "SELECT * FROM `LuanTranHumanResources`.`leave` WHERE id = #{id}"
    @connect.query(sql)
  end

  def update_request(reason, id)
    sql  = "UPDATE `LuanTranHumanResources`.`leave` SET reason = #{reason}, status = 'sending' WHERE id = #{id}"
  end

  def delete_request(id)
    sql  = "DELETE FROM `LuanTranHumanResources`.`leave` WHERE id = #{id}"
    @connect.query(sql)
  end
end
