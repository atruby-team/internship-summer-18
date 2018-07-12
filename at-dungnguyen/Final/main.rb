require './controller/session_controller'
require './model/employee'
require 'pry'
class HumanResources
  ADMIN = 2
  MEMBER = 0
  LEADER = 1
  def initialize
    @session = SessionController.new
  end

  def execute(function)
    case function
    when 1
      @user = @session.log_in
      screen2(@user) if @user
    when 2
      execute(1) if @session.register
    when 3
      @session.forgot_password
    when 0
      p 'exit'
    end
  end

  def screen1
    system('clear')
    p 'Welcome to Human Resources!'
    p '============================'
    p '1. Log in'
    p '2. Register'
    p '3. Forgot password'
    p '0. Exit'
    p '============================'
  end

  def screen2(user)
    system('clear')
    p 'Welcome to Human Resources!'
    p '============================'
    p '1. Team Management'
    p '2. Leave Management'
    p '3. Notification management'
    p '4. Log out'
    p '5. CSV' if user['role'] == HumanResources::ADMIN
    p '0. Exit'
    p '============================'
  end

  def input1
    p 'Please input a number(0 - 3)'
    loop do
      begin
        function = Integer(gets)
      rescue StandardError
        p 'Please input a number(0 - 3)'
      end
      if (0..3).cover? function
        execute function
        break
      else
        p 'Please input a number(0 - 3)'
      end
    end
  end
end

hr = HumanResources.new
hr.screen1
hr.input1
