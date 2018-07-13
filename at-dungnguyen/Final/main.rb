require './controller/session_controller'
require './controller/team_controller'
require './model/employee'
require './model/team'
require 'pry'

class HumanResources
  def initialize
    @sc = SessionController.new
    @tc = TeamController.new
    @ch = true
  end

  def run
    while @ch
      screen1
      function = input
      clear
      execute(function) if (0..3).cover? function
    end
  end

  def execute(function)
    case function
    when 1
      @user = @sc.log_in
      while @user
        screen2
        function = input
        clear
        execute2(function) if (0..5).cover? function
      end
    when 2
      @sc.register
    when 3
      @sc.forgot_password
    when 0
      @ch = false
      puts 'Exit'
    end
  end

  def execute2(function)
    case function
    when 1
      @flag_team = true
      while @flag_team
        team_management
        function = input
        clear
        execute_team(function) if (0..5).cover? function
      end
    when 2
      p 'leave_management'
    when 3
      p 'noti management'
    when 4
      @user = nil
    when 5
      p 'Access Denied' unless @user['role'] == SessionController::ADMIN
    when 0
      @user = nil
      execute(0)
    end
  end

  def execute_team(function)
    case function
    when 1
      members = @tc.members(@user['team'])
      if members.any?
        members.each do |mem|
          p "ID: #{mem['id']}, Name: #{mem['name']}"
        end
      else
        p 'No result'
      end
      p '====================================================================='
    when 2
      @flag_team = false
    when 3
      @flag_team = false
      @user = nil
    when 4
      @tc.add_member(@user['team']) if @user['role'] == SessionController::LEADER
    when 5
      @tc.add_team if @user['role'] == SessionController::ADMIN
    when 0
      @flag_team = false
      execute2(0)
    end
  end

  def screen1
    p 'Welcome to Human Resources!'
    p '============================'
    p '1. Log in'
    p '2. Register'
    p '3. Forgot password'
    p '0. Exit'
    p '============================'
    p 'Please choose a function'
  end

  def screen2
    p 'Welcome to Human Resources!'
    p '============================'
    p '1. Team Management'
    p '2. Leave management'
    p '3. Notification management'
    p '4. Logout'
    p '5. CSV' if @user['role'] == SessionController::ADMIN
    p '0. Exit'
    p '============================'
  end

  def team_management
    p 'Team Management'
    p '==============='
    p '1. Show list of members'
    p '2. Back'
    p '3. Logout'
    p '4. Add a member' if @user['role'] == SessionController::LEADER
    p '5. Create new team' if @user['role'] == SessionController::ADMIN
    p '0. Exit'
  end

  def leave_management
    p 'Leave Management'
    p '==============='
    p '1. Send a leave request'
    p '2. Update a leave request'
    p '3. Show list of leaves of employees.'
    p '4. Back'
    p '5. Logout'
    p '6. Show list leaves request need approve' if @user['role'] == SessionController::LEADER
    p '7. Approve or reject leave request' if @user['role'] == SessionController::LEADER
    p '0. Exit'
  end

  def notification_management; end

  def input
    Integer(gets)
  rescue StandardError
    input
  end

  def clear
    system('clear')
  end
end

hr = HumanResources.new
hr.run
