require 'bcrypt'
require './models/employee.rb'
require 'pry'
class SessionController
  def login
    system('clear')
    p '==========Login==========='
    p 'Enter username:'
    username = gets.chomp
    p 'Enter password:'
    password = gets.chomp
    result = Employee.new.check_user(username)
    unless result.empty?
      result.each do |x|
        next unless BCrypt::Password.new(x.values_at('password').first) == password
        user_login = Employee.new
        user_login.id = x['id']
        user_login.id_team = x['id_team']
        user_login.username = x['username']
        return user_login
      end
    end
    false
  end

  def register
    name = ''
    username = ''
    loop do
      system('clear')
      p '==========Register==========='
      p 'Enter name:'
      name = gets.chomp
      p 'Enter username:'
      username = gets.chomp
      result = Employee.new.em_forgot(username)
      break if result.empty?
    end
    p 'Enter password:'
    password = BCrypt::Password.create(gets.chomp)
    p 'Choose role:(1 -> root, 2-> team_lead, 3-> team_member)'
    number = gets.chomp.to_i
    role = if number == 1
             'root'
           elsif number == 2
             'team_lead'
           else
             'team_member'
           end
    result = Employee.new.add_employee(name, username, password, role)
    system('clear')
    if result
      p 'Register success'
    else
      p 'Error'
    end
    SessionController.new.login
  end

  def forgot_password
    system('clear')
    p '==========Forgit Password==========='
    p 'Enter username:'
    username = gets.chomp
    result = Employee.new.check_user(username)
    if !result.empty?
      p 'Enter new password:'
      password = BCrypt::Password.create(gets.chomp)
      role = 'root'
      Employee.new.update_password(username, password)
      p 'Update success'
    else
      p 'Invalid username'
    end
  end
end
