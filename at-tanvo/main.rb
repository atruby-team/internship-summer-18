require './Controllers/session_controller'
require './Model/employee.rb'

def login
  if SessionController.new.login
    puts 'Login success'
  else
    p 'Wrong user or password'
  end
end

def register
  SessionController.new.register
end

def forgot_password
  SessionController.new.forgot_password
end

def scene1
  loop do
    puts 'xxxxxxx Human Resource xxxxxxx'
    puts '1.Login'
    puts '2.Register'
    puts '3.Forgot Password'
    puts '4.Exit'
    puts 'Choose :'
    x = gets.chomp.to_i
    case x
    when 1
      login
    when 2
      register
    when 3
      forgot_password
    when 4
      exit!
    else
      system('clear')
    end
  end
end

scene1
