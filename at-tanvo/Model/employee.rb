require 'mysql2'
require 'bcrypt'
require 'pry'

class Employee
  attr_accessor :id, :name, :team, :role, :username, :password, :leave_balance
  def initialize
    @client = Mysql2::Client.new(host: 'localhost', username: 'root', password: '123456', database: 'TanVo_HumanResources')
  end

  def check_user(username)
    sql = "SELECT * FROM `TanVo_HumanResources`.`employee` WHERE username = '#{username}'"
    @client.query(sql)
  end

  def add(name, username, password, role)
    sql = "INSERT INTO `TanVo_HumanResources`.`employee`(name, role, username, password, leave_balance) VALUES('#{name}','#{role}','#{username}','#{password}',10)"
    @client.query(sql)
  end

  def update_password(username, password)
    sql = "UPDATE `TanVo_HumanResources`.`employee` SET password = '#{password}' WHERE username = '#{username}'"
    @client.query(sql)
  end
end
