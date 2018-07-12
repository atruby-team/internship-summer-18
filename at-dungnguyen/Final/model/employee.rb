require 'pry'
require 'mysql2'
class Employee
  attr_reader :id
  attr_accessor :name, :team, :role, :username, :password, :leave_balance
  def initialize
    @client = Mysql2::Client.new(host: '127.0.0.1', username: 'root', password: 'win112344', database: 'DungNguyen_HumanResources')
  end

  def add(username, password, name)
    sql = "INSERT INTO `DungNguyen_HumanResources`.`employee`(name, role, username, password, leave_balance)
     VALUES('#{name}', 0, '#{username}', '#{password}', 0)"
    @client.query(sql)
  end

  def username?(username)
    sql = "SELECT * FROM `DungNguyen_HumanResources`.`employee` WHERE employee.username = '#{username}'"
    @client.query(sql)
  end

  def update_password(username, password)
    sql = "UPDATE `DungNguyen_HumanResources`.`employee` SET password = '#{password}' WHERE username = '#{username}'"

    @client.query(sql)
  end
end
