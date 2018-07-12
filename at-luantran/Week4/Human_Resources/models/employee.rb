require 'bcrypt'
require 'mysql2'

class Employee
  attr_accessor :id, :name, :team, :role, :username, :password, :leave_balance
  def initialize
    @connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                                password: 'hoichuphong513',
                                database: 'LuanTranHumanResources')
  end

  def check_user(username)
    sql = "SELECT * FROM `LuanTranHumanResources`.`employee` WHERE username = '#{username}'"
    @connect.query(sql)
  end
  def add_employee(name, username, password, role)
    sql = "INSERT INTO `LuanTranHumanResources`.`employee`(name, role, username, password, leave_balance)
                        VALUES('#{name}', '#{role}', '#{username}', '#{password}', 10)"
    @connect.query(sql)
  end

  def update_password(username, password)
    sql = "UPDATE `LuanTranHumanResources`.`employee` SET password = '#{password}' WHERE username = '#{username}'"
    @connect.query(sql)
  end


  def get_team_lead
    sql = "SELECT * FROM `LuanTranHumanResources`.`employee` WHERE role = 'team_lead' and id_team = 0 "
    @connect.query(sql)
  end

  def update_team(id_lead, id_team)
    sql = "UPDATE `LuanTranHumanResources`.`employee` SET id_team = '#{id_team}' WHERE id = '#{id_lead}'"
    @connect.query(sql)
  end
end
