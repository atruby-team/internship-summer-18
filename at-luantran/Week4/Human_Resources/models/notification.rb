require 'mysql2'

class Notification
  attr_accessor :id, :title, :content, :publish_dates, :id_team
  def initialize
    @connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                                  password: 'hoichuphong513',
                                  database: 'LuanTranHumanResources')
  end
  
  def add_notif(title, content, id_team)
    date = DateTime.now
    d = DateTime.parse(date.to_s).to_time.strftime("%F %T")
    sql = "INSERT INTO `LuanTranHumanResources`.`notification`(title, content, pulbish_date, id_team)
                        VALUES('#{title}', '#{content}', '#{d}', #{id_team})"
    @connect.query(sql)
  end

  def get_list(id_team)
    sql  = "SELECT * FROM `LuanTranHumanResources`.`notification` WHERE id_team = #{id_team}"
    @connect.query(sql)
  end

  def get_item(id)
    sql  = "SELECT * FROM `LuanTranHumanResources`.`notification` WHERE id = #{id}"
    @connect.query(sql)
  end

  def delete(id)
    sql  = "DELETE FROM `LuanTranHumanResources`.`notification` WHERE id = #{id}"
    @connect.query(sql)
  end
end