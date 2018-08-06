require_relative '../Migrate/connect_db'
require_relative '../Models/employee_model'
require 'pry'
require 'bcrypt'
class SessionController
  $session = {}
  def login
    system('clear')
    p '=============LOGIN============='
    print 'User Name: '
    user_name = gets.chomp
    print 'Password: '
    password = gets.chomp
    login = EmployeeModel.login(user_name, password)
    if login
      $session[:user] = user_name
      p 'Login Success'
    else
      p 'Invalid Username or Password'
    end

    binding.pry
  end

  def self.register
    system('clear')
    p '===========REGISTER============'
    print 'Name: '
    name = gets.chomp
    loop do
      print 'User Name: '
      @user_name = gets.chomp
      check = EmployeeModel.check_user(@user_name)
      if check.count == 0
        break
      else
        p 'User Exist !'
      end
    end
    print 'Password: '
    password = BCrypt::Password.create(gets.chomp)
    print 'Team Id: '
    team_id = gets.chomp.to_i
    register = EmployeeModel.register(name, team_id, @user_name, password)
    'Register Success'
    EmployeeModel.login(user_name, password)
  end

  def self.forgot_password
    system('clear')
    p '=======FORGOT PASSWORD========='
    print 'User Name: '
    user_name = gets.chomp
    check = EmployeeModel.check_user(user_name)
    if check.count == 0
      print 'Enter New Password: '
      password = BCrypt::Password.create(gets.chomp)
      EmployeeModel.reset_password(user_name, password)
      p 'Reset Password Success !'
    else
      p 'Invalid User'
    end
  end
end
