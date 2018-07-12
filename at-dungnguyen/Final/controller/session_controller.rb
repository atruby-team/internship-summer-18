Dir['../model/*.rb'].each { |file| require file }
require 'io/console'
require 'pry'
require 'bcrypt'
class SessionController
  def initialize
    @employee = Employee.new
  end

  def log_in
    p 'Log In'
    p '======'
    username, password = input
    temp = @employee.username?(username)
    user = temp.first
    return user if temp.count > 0 && BCrypt::Password.new(user['password']) == password
    p 'Wrong password or password'
    nil
  end

  def register
    p 'Register'
    p '========'
    p 'Name:'
    name = gets.chomp
    username, password = input
    password = BCrypt::Password.create(password)
    begin
      @employee.add(username, password, name)
      system('clear')
      p 'Register success'
      return true
    rescue StandardError
      system('clear')
      p 'Username exist!'
      register
    end
  end

  def forgot_password
    p 'Forgot Password'
    p '==============='
    p 'Input username:'
    username = gets.chomp
    if @employee.username?(username)
      p 'Input password:'
      password = BCrypt::Password.create(STDIN.noecho(&:gets).chomp)
      @employee.update_password(username, password)
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
end
