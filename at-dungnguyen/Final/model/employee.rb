require 'pry'
require 'mysql2'
class Employee
  attr_reader :id
  attr_accessor :name, :team, :role, :username, :password, :leave_balance
  @@client = Mysql2::Client.new(host: '127.0.0.1', username: 'root', password: 'win112344', database: 'DungNguyen_HumanResources')

  def initialize(name, role, username, password, leave_balance)
    @name = name
    @role = role
    @username = username
    @password = password
    @leave_balance = leave_balance
  end

  def self.add(employee)
    sql = "INSERT INTO employee(name, role, username, password, leave_balance)
     VALUES('#{employee.name}', #{employee.role}, '#{employee.username}', '#{employee.password}', #{employee.leave_balance})"
    @@client.query(sql)
    @@client.affected_rows
  end

  def self.username?(username)
    sql = "SELECT * FROM employee WHERE username = '#{username}'"
    @@client.query(sql).first
  end

  def self.update_password(username, password)
    sql = "UPDATE employee SET password = '#{password}' WHERE username = '#{username}'"
    @@client.query(sql)
    @@client.affected_rows
  end
end
