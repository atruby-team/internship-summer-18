require 'bcrypt'
require 'mysql2'

class Employee
  attr_accessor :id, :name, :team, :id_team, :role, :username, :password, :leave_balance
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
    sql = "INSERT INTO `LuanTranHumanResources`.`employee`(name, id_team, role, username, password, leave_balance)
                        VALUES('#{name}', 0, '#{role}', '#{username}', '#{password}', 10)"
    @connect.query(sql)
  end

  def update_password(username, password)
    sql = "UPDATE `LuanTranHumanResources`.`employee` SET password = '#{password}' WHERE username = '#{username}'"
    @connect.query(sql)
  end

  def get_employee(position)
    sql = "SELECT * FROM `LuanTranHumanResources`.`employee` WHERE role = '#{position}' and id_team = 0 "
    @connect.query(sql)
  end

  def update_team(id_employee, id_team)
    sql = "UPDATE `LuanTranHumanResources`.`employee` SET id_team = '#{id_team}' WHERE id = '#{id_employee}'"
    @connect.query(sql)
  end

  def get_member_team(id_team)
    sql = "SELECT * FROM `LuanTranHumanResources`.`employee` WHERE id_team = #{id_team}"
    @connect.query(sql)
  end

  def update_balance(id, total_date_off)
    sql = "UPDATE `LuanTranHumanResources`.`employee` SET leave_balance = leave_balance - #{total_date_off} WHERE id = '#{id}'"
    @connect.query(sql)
  end
end
