require 'bcrypt'
require 'mysql2'

class Employee
  attr_accessor :id, :name, :team, :role, :username, :password, :leave_balance
  @connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                                password: 'hoichuphong513',
                                database: 'LuanTranHumanResources')
  def initialize; end

  def self.check_login(username, password)
    sql = "SELECT * FROM `LuanTranHumanResources`.`employee` WHERE username = '#{username}'"
    result = @connect.query(sql)
    result.each do |x|
      BCrypt::Password.new(x.values_at('password').first) == password
    end
    false
  end

  def self.add_employee(name, username, password)
    sql = "INSERT INTO `LuanTranHumanResources`.`employee`(name, role, username, password, leave_balance)
                        VALUES('#{name}', 'Employee', '#{username}', '#{password}', 10)"
    @connect.query(sql)
  end

  def self.em_forgot(username)
    sql = "SELECT * FROM `LuanTranHumanResources`.`employee` WHERE username = '#{username}'"
    @connect.query(sql)
  end

  def self.update_password(username, password)
    sql = "UPDATE `LuanTranHumanResources`.`employee` SET password = '#{password}' WHERE username = '#{username}'"
    @connect.query(sql)
  end
end
