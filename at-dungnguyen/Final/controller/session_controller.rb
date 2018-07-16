Dir['../model/*.rb'].each { |file| require file }
require 'io/console'
require 'pry'
require 'bcrypt'

class SessionController
  ADMIN = 2
  MEMBER = 0
  LEADER = 1

  def log_in(username, password)
    temp = Employee.username?(username)
    return temp if BCrypt::Password.new(temp['password']) == password
    nil
  end

  def register(name, username, password)
    return false if Employee.username?(username)
    password = BCrypt::Password.create(password)
    employee = Employee.new(name, SessionController::MEMBER, username, password, 12)
    return true if Employee.add(employee) > 0
    false
  end

  def forgot_password(username)
    if Employee.username?(username)
      p 'Input password:'
      password = BCrypt::Password.create(STDIN.noecho(&:gets).chomp)
      Employee.update_password(username, password)
      p 'Update password Success'
    else
      p 'Invalid username'
    end
  end
end
