require 'mysql2'

class Team
  attr_accessor :id, :name, :team_lead, :total_members
  def initialize
    @connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                                  password: 'hoichuphong513',
                                  database: 'LuanTranHumanResources')
  end

  def create_team(name, team_lead)
    sql = "INSERT INTO `LuanTranHumanResources`.`team`(name, team_lead)
                        VALUES('#{name}', '#{team_lead}')"
    @connect.query(sql)
  end

  def add_member
    
  end

  def update
    
  end

  def members
  end
  
  def get_id
    sql = "SELECT MAX(id) as id_max  FROM `LuanTranHumanResources`.`team`"
    @connect.query(sql)
  end
end
