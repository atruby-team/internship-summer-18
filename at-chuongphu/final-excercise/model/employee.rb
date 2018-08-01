class Employee
  attr_accessor :id, :name, :team, :role, :username, :password, :leave_balance
  def initialize (name, team, role, username, password, leave_balance)
    self.name = name
    self.team = team
    self.role = role
    self.username = username
    self.password = password
    self.leave_balance = leave_balance
  end
end
