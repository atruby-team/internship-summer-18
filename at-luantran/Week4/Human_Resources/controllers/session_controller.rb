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
    if result.size > 0
      result.each do |x|
        if(BCrypt::Password.new(x.values_at('password').first) == password)
          return true
        end
      end
    end
    return false
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
      break if result.size == 0
    end
    p 'Enter password:'
    password = BCrypt::Password.create(gets.chomp)
    p 'Choose role:(1 -> root, 2-> team_lead, 3-> team_member)'
    number = gets.chomp.to_i
    if(number == 1) 
      role = 'root'
    elsif(number == 2)
      role = 'team_lead'
    else
      role = 'team_member'
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
    if result.size > 0
      p 'Enter new password:'
      password = gets.chomp
      Employee.new.update_password(username, password)
      p 'Update success'
    else
      p 'Invalid username'
    end
  end
end
