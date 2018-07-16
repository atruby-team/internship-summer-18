class Main
  def intialize
  end

  def choose_option
    puts '----------Home----------'
    puts '1. Register'
    puts '2. Login'
    puts '3. Forgot Password'
    print 'Select number: '
    number = begin
      Interger(gets)
            rescue StandardError
              false
            end
    if number == false
      puts 'incorrect number!'
      csleep
      csexit
      choose_option
    end
    register_page if number == 1
    login_page if number == 2
    forgot_page if number == 3
  end

  def register_page
    clear
    puts '-----Resgister----'
    print 'name: '
    name = gets.chomp
    print 'username'
    username = gets.chomp
    print 'password: '
    password = get.chomp

    