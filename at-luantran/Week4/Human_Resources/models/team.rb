require 'mysql2'

class Team
  attr_accessor :id, :name, :team_lead, :total_members
  def initialize
    @connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                                  password: 'hoichuphong513',
                                  database: 'LuanTranHumanResources')
  end

  def create_team(name, team_lead)
    sql = "INSERT INTO `LuanTranHumanResources`.`team`(name, team_lead, total_members)
                        VALUES('#{name}', '#{team_lead}', 1)"
    @connect.query(sql)
  end

  def get_id_max
    sql = 'SELECT MAX(id) as id_max  FROM `LuanTranHumanResources`.`team`'
    @connect.query(sql)
  end

  def update_member(id_team)
    sql = "UPDATE `LuanTranHumanResources`.`team` SET total_members = total_members + 1 WHERE id = '#{id_team}'"
    @connect.query(sql)
  end
end
