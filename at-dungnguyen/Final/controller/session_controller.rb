Dir['../model/*.rb'].each { |file| require file }
require 'io/console'
require 'pry'
require 'bcrypt'

class SessionController
  ADMIN = 2
  MEMBER = 0
  LEADER = 1

  def log_in
    username, password = input
    temp = Employee.username?(username)
    user = temp.first
    clear
    return user if temp.count > 0 && BCrypt::Password.new(user['password']) == password
    p 'Wrong password or password'
    nil
  end

  def register
    p 'Name:'
    name = gets.chomp
    username, password = input
    password = BCrypt::Password.create(password)
    employee = Employee.new(name, SessionController::MEMBER, username, password, 12)
    begin
      Employee.add(employee)
      clear
      p 'Register success'
    rescue StandardError
      clear
      p 'Username exist!'
    end
  end

  def forgot_password
    p 'Input username:'
    username = gets.chomp
    if Employee.username?(username).count > 0
      p 'Input password:'
      password = BCrypt::Password.create(STDIN.noecho(&:gets).chomp)
      Employee.update_password(username, password)
      clear
      p 'Update password Success'
    else
      p 'Invalid username'
    end
  end

  def input
    p 'Username:'
    username = gets.chomp
    p 'Password:'
    password = STDIN.noecho(&:gets).chomp
    [username, password]
  end

  def clear
    system('clear')
  end
end
