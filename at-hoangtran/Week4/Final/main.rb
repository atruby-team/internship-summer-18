require_relative './Controllers/session_controller'
require 'pry'
class Main
  def initialize; end

  def self.login
    user = SessionController.new
    user.login
  end

  def self.register
    SessionController.register
  end

  def self.reset_password
    SessionController.forgot_password
  end

  def self.screen1
    system('clear')
    loop do
      p '=================HUMAN RESOURCES================='
      p '1. Login'
      p '2. Register'
      p '3. Reset Password'
      print 'Please Enter: '
      choose = gets.chomp.to_i
      case choose
      when 1
        Main.login
      when 2
        Main.register
      when 3
        Main.reset_password
      else
        p 'Please choose again !'
      end
    end
  end

  def self.screen2
    # loop do
    #   p '===========================MANAGEMENT==========================='
    #   p '1. Team Management'
    #   p '2. Leave Management'
    #   p '3. Nofitication Management'
    #   p '4. Logout'
    #   p '5. Exit'
    #   p '6. CSV'

    # end
  end
end
Main.screen1
