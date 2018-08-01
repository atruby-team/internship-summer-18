require './controller/session_controller'
require './controller/team_controller'
require './controller/notification_controller'
require './controller/leave_controller'
require './model/employee'
require './model/team'
require './model/notification'
require './model/leave'
require 'pry'

class HumanResources
  def initialize
    @sc = SessionController.new
    @tc = TeamController.new
    @nc = NotificationController.new
    @lc = LeaveController.new
  end

  # Session
  def execute(function)
    case function
    when 1
      log_in
      while @user
        screen2
        function = input
        clear
        execute2(function) if (0..5).cover? function
      end
    when 2
      register
    when 3
      forgot_password
    when 0
      @ch = false
      puts 'Exit'
    end
  end

  def log_in
    username, password = input_account
    @user = @sc.log_in(username, password)
    clear
    if @user
      p 'Login Success'
    else
      p 'Wrong username or password'
    end
  end

  def register
    p 'Name: '
    name = gets.chomp
    username, password = input_account
    clear
    if @sc.register(name, username, password)
      p 'Register Success'
    else
      p 'Username Exist!'
    end
  end

  def forgot_password
    p 'Input username:'
    username = gets.chomp
    @sc.forgot_password username
  end

  def input_account
    p 'Username:'
    username = gets.chomp
    p 'Password:'
    password = STDIN.noecho(&:gets).chomp
    [username, password]
  end

  # Team
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

  # Norification
  def notification_management
    p 'Notification Management'
    p '======================='
    p '1. List Notification'
    p '2. Read a notification'
    p '3. Back'
    p '4. Logout'
    p '5. Send a notification' if @user['role'] == SessionController::LEADER
    p '6. Delete a notification' if @user['role'] == SessionController::LEADER
    p '0. Exit'
  end

  def execute_notify(function)
    case function
    when 1
      all_notify
    when 2
      g_notify
    when 3
      @flag_notify = false
    when 4
      @flag_notify = false
      @user = nil
    when 5
      send_notify
    when 6
      del_notify
    when 0
      @flag_notify = false
      execute2(0)
    end
  end

  def all_notify
    if @user['team']
      list_notify = @nc.get_items(@user['team'])
      if list_notify.any?
        list_notify.each do |notify|
          puts "#{notify['id']} : #{notify['title']} | #{notify['publish_date']}"
        end
      end
    end
    p '====================================================================='
  end

  def g_notify
    p 'Input id notification'
    id = input
    notify = @nc.get_item(id, @user)
    clear
    if notify
      p "#{notify['id']} : #{notify['title']} | #{notify['publish_date']}"
      p notify['content']
    else
      p 'Invalid ID'
    end
    p '================================='
  end

  def send_notify
    p 'Input title'
    title = gets.chomp
    p 'Input content'
    content = gets.chomp
    publish_date = Time.now
    id_team = @user['team']
    notify = Notification.new(title, content, publish_date.strftime('%F %T'), id_team)
    clear
    if @nc.add_item(notify)
      p 'Send notify success'
    else
      p 'Send error!'
    end
    p '================================'
  end

  def del_notify
    p 'Input id notification'
    id = input
    clear
    if @nc.del_item(id)
      p 'Delete Notification Success'
    else
      p "Notification doesn't exist!"
    end
    p '================================'
  end

  # Leave
  def leave_management
    p 'Leave Management'
    p '==============='
    p '1. Send a leave request'
    p '2. Update a leave request'
    p '3. Delete a leave request'
    p '4. Show list of leaves of employees.'
    p '5. Back'
    p '6. Logout'
    p '7. Show list leaves request need approve' if @user['role'] == SessionController::LEADER
    p '8. Approve or reject leave request' if @user['role'] == SessionController::LEADER
    p '0. Exit'
  end

  def execute_leave(function)
    case function
    when 1
      send_request
    when 2
      update_request
    when 3
      delele_request(@user)
    when 4
      list_approved
    when 5
      @flag_leave = false
    when 6
      @flag_leave = false
      @user = nil
    when 7
      list_need_approve if @user['role'] == SessionController::LEADER
    when 8
      update_status if @user['role'] == SessionController::LEADER
    when 0
      @flag_leave = false
      execute2(0)
    end
  end

  def send_request
    p 'Reason'
    reason = gets.chomp
    p 'Total date off'
    total_date_off = input
    time = Time.now
    request = Leave.new(@user['id'], reason, total_date_off, 0, time.strftime('%F %T'))
    clear
    if @lc.add_item(request)
      p 'Send Sucess'
    else
      p 'Send Error'
    end
  end

  def update_request
    p 'ID leave request'
    id = input
    p 'Reason'
    reason = gets.chomp
    p 'Total date off'
    total_date_off = input
    leave = Leave.new(@user['id'], reason, total_date_off, 0, 0)
    if @lc.update_leave(id, leave, @user)
      p 'Update Sucess'
    else
      p 'Update Error'
    end
  end

  def delele_request(user)
    p 'ID leave request'
    id = input
    if @lc.del_item(id, user)
      p 'Delete Sucess'
    else
      p 'Delete Error'
    end
  end

  def list_approved
    if @lc.all_approved.any?
      @lc.all_approved.each do |leave|
        p "ID: #{leave['id']} - User: #{leave['id_user']} - Reason: #{leave['reason']} - Date off: #{leave['total_date_off']}"
      end
    else
      p 'No result'
    end
  end

  def list_need_approve
    if @lc.need_approve.any?
      @lc.need_approve.each do |leave|
        p "ID: #{leave['id']} - User: #{leave['id_user']} - Reason: #{leave['reason']} - Date off: #{leave['total_date_off']}"
      end
    else
      p 'No result'
    end
  end

  def update_status
    p 'ID leave request'
    id = input
    p 'Approve or Reject'
    status = input
    if @lc.update_status(id, status)
      p 'Update Success'
    else
      p 'Update Error'
    end
  end

  # Default
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

  def run
    @ch = true
    while @ch
      screen1
      function = input
      clear
      execute(function) if (0..3).cover? function
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
      @flag_leave = true
      while @flag_leave
        leave_management
        function = input
        clear
        execute_leave(function) if (0..8).cover? function
      end
    when 3
      @flag_notify = true
      while @flag_notify
        notification_management
        function = input
        clear
        execute_notify(function) if (0..6).cover? function
      end
    when 4
      @user = nil
    when 5
      p 'Access Denied' unless @user['role'] == SessionController::ADMIN
    when 0
      @user = nil
      execute(0)
    end
  end

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
