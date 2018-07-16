require_relative '../Migrate/connect_db'
require 'bcrypt'
require 'pry'
class EmployeeModel
  attr_accessor :employee_id, :name, :team_id, :role, :user_name, :password, :leave_blance
  def initialize; end

  def self.get_team_lead(team_id)
    result = $client.query("SELECT * FROM TranHoang_HumanResources.TeamLeader WHERE team_id = '#{team_id}'")
    @team_lead = result.to_a
    @team_lead
  end

  def self.login(user_name, password)
    sql = "SELECT * FROM TranHoang_HumanResources.Employee WHERE user_name = '#{user_name}';"
    user = $client.query(sql)
    if user.count != 0
      pass = BCrypt::Password.new(user.to_a[0]['password'])
      return true if pass == password
    end
    false
  end

  def self.register(name, team_id, user_name, password)
    sql = "INSERT INTO TranHoang_HumanResources.Employee(name, team_id, role_id, user_name, password, leave_balance) VALUES ('#{name}', '#{team_id}', 1,  '#{user_name}', '#{password}', 12);"
    result = $client.query(sql)
  end

  def self.check_user(user_name)
    sql = "SELECT * FROM TranHoang_HumanResources.Employee WHERE user_name = '#{user_name}'"
    result = $client.query(sql)
  end

  def self.reset_password(user_name, password)
    sql = "UPDATE TranHoang_HumanResources.Employee SET password = '#{password}' WHERE user_name = '#{user_name}'"
    result = $client.query(sql)
  end
end

EmployeeModel.get_team_lead
