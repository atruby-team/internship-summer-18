require 'bcrypt'
require './models/employee.rb'
class SessionController
  def self.login
    system('clear')
    p '==========Login==========='
    p 'Enter username:'
    username = gets.chomp
    p 'Enter password:'
    password = gets.chomp
    Employee.check_login(username, password)
  end

  def self.register
    name = ''
    username = ''
    loop do
      system('clear')
      p '==========Register==========='
      p 'Enter name:'
      name = gets.chomp
      p 'Enter username:'
      username = gets.chomp
      result = Employee.em_forgot(username)
      break if result.empty?
    end
    p 'Enter password:'
    password = BCrypt::Password.create(gets.chomp)
    result = Employee.add_employee(name, username, password)
    system('clear')
    if result
      p 'Register success'
    else
      p 'Error'
    end
    SessionController.login
  end

  def self.forgot_password
    system('clear')
    p '==========Forgit Password==========='
    p 'Enter username:'
    username = gets.chomp
    result = Employee.em_forgot(username)
    if !result.empty?
      p 'Enter new password:'
      password = gets.chomp
      Employee.update_password(username, password)
      p 'Update success'
    else
      p 'Invalid username'
    end
  end
end
