require 'bcrypt'
require './Model/employee.rb'
class SessionController
  def login
    system('clear')
    puts 'xxxxxxx Login xxxxxxx'
    puts 'Username: '
    username = gets.chomp
    puts 'Password:'
    password = gets.chomp
    result = Employee.new.check_user(username)
    unless result.count == 0
      result.each do |n|
        next unless BCrypt::Password.new(n.values_at('password').first) == password
        user_login =  Employee.new
        user_login.id = x['id']
        user_login.username = x['username']
        return user_login
      end
    end
  end

  def register
    name = ''
    username = ''
    loop do
      system('clear')
      puts 'xxxxxxx Register xxxxxxx'
      puts 'Name : '
      name = gets.chomp
      puts 'Username : '
      username = gets.chomp
      result = Employee.new.check_user(username)
      break if result.count == 0
    end
    puts 'Password : '
    password = BCrypt::Password.create(gets.chomp)
    puts 'Chon role (1: root; 2: team_leader; 3: team_member)'
    num = gets.chomp.to_i
    if num == 1
      role = 'root'
    elsif num == 2
      role = 'team_leader'
    elsif num == 3
      role = 'team_member'
    end
    result = Employee.new.add(name, username, password, role)
    system('clear')
    if result
      puts 'Register success'
    else
      puts 'Unsuccess'
    end
    SessionController.login
  end

  def forgot_password
    system('clear')
    puts 'xxxxxxx Forgot Password xxxxxxx'
    puts 'Username : '
    username = gets.chomp
    result = Employee.new.check_user(username)
    if result.count != 0
      puts 'New Password : '
      password = BCrypt::Password.create(gets.chomp)
      Employee.new.update_password(username, password)
      puts 'Update Success'
    else
      puts 'Fail'
    end
  end
end
