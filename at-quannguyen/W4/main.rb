require_relative './controllers/session_controller'
require_relative './controllers/team_controller'
require_relative './controllers/notification_controller'
require_relative './controllers/csv_controller'
require_relative './controllers/leave_controller'
require_relative 'models/employee'
require_relative 'models/team'
require_relative 'models/notification'
require_relative 'models/leave'
require 'csv'
class Main
  def initialize
    @session_controller = SessionController.new
    @team_controller = TeamController.new
    @notification_controller = NotificationController.new
    @csv_controller = CsvController.new
    @leave_controller = LeaveController.new
    run
  end

  def run
    puts '================ Wellcome To Portal ================'
    action_login_register
  end

  def action_login_register
    puts '========= Selete (Login/Register) ========='
    puts '1. Register'
    puts '2. Login'
    puts '3. Action forgot'
    print 'Action : '
    number = begin
               Integer(gets)
             rescue StandardError
               false
             end
    if number == false
      puts 'input not string !'
      csleep
      cexit
      action_login_register
    end
    action_register if number == 1
    action_login if number == 2
    action_forgot_password if number == 3
  end

  def action_login
    clear
    puts '========= Login ========='
    print 'username : '
    username = gets.chomp
    puts ''
    print 'password : '
    password = gets.chomp

    employee = Employee.new.tap do |e|
      e.username = username
      e.password = password
    end

    if @session_controller.login(employee)
      puts 'Login complete !'
      csleep
      action_after_login
    else
      puts 'Login fail !'
      csleep
      cexit
      action_login
    end
  end

  def action_register
    clear
    puts '========= Register ========='
    print 'name : '
    name = gets.chomp
    puts ''
    print 'username : '
    username = gets.chomp
    puts ''
    print 'password : '
    password = gets.chomp

    employee = Employee.new.tap do |e|
      e.name = name
      e.username = username
      e.password = password
      e.role = 0
      e.leave_balance = 12
    end

    if @session_controller.register(employee)
      puts 'Register complete !'
      csleep
      action_login
    else
      puts 'Username extis !'
      csleep
      cexit
      action_register
    end
  end

  def action_forgot_password
    clear
    puts '========= Forgot Password ========='
    print 'username : '
    username = gets.chomp
    if @session_controller.username_by_employee(username).count.zero?
      puts 'Account does not exist !'
      csleep
      cexit
      action_forgot_password
    else
      clear
      print 'new password : '
      password = gets.chomp
      employee = Employee.new.tap do |e|
        e.username = username
        e.password = password
      end
      if @session_controller.forgot_password(employee)
        puts 'Action forgot complete !'
        csleep
        action_login
      else
        puts 'Action forgot extis !'
        csleep
        cexit
        action_forgot_password
      end
    end
  end

  def action_after_login
    clear
    puts '========= Task Manager ========='
    puts '1. Team management'
    puts '2. Leave management'
    puts '3. Notification management'
    puts '4. CSV'
    print 'Action : '
    number = begin
               Integer(gets.chomp)
             rescue StandardError
               false
             end

    if number == false
      puts 'input not string !'
      csleep
      cexit
      action_after_login
    end

    action_team_manager if number == 1
    action_leave_manager if number == 2
    action_notification_manager if number == 3
    action_csv_manager if number == 4
  end

  def action_team_manager
    clear
    account = @session_controller.current_user.first
    team_id = account['team_id']
    role = account['role']

    puts '========= Team Manager ========='
    puts '0. Update a team' if role == 1
    puts '1. Create a new team' if role == 1
    puts '1. Add a new member' if role == 2
    puts '2. Show list of members'
    puts '3. Back'
    puts '4. Logout'
    puts '5. Exit program'
    print 'Action : '
    number = begin
               Integer(gets.chomp)
             rescue StandardError
               false
             end

    if number == false
      puts 'input not string !'
      csleep
      cexit
      action_team_manager
    end

    if role == 1
      new_team if number == 1
      action_update_team if number.zero?
    end

    if role == 2
      action_add_member_team if number == 1
    end

    action_show_members_team if number == 2
    action_logout_back_exit number
  end

  def new_team
    clear
    puts '========= New Team ========='
    print 'name team : '
    name_team = gets.chomp
    puts ''
    print 'username leader : '
    user_leader = gets.chomp
    username = (@session_controller.username_by_employee user_leader).first
    user_id = username['id']
    role = username['role']
    if username.count.zero?
      puts 'Username not extis !'
      csleep
      cexit
      new_team
    else
      if role == 2
        puts 'The member was the leader !'
        csleep
        cexit
        new_team
      else
        team = Team.new.tap do |e|
          e.name = name_team
          e.employee_id = user_id
        end
        @team_controller.new(team)
      end
    end
  end

  def action_add_member_team
    clear
    puts '========= Add Member Team ========='
    print 'username : '
    username = gets.chomp

    current_user = @session_controller.current_user.first
    team_current_id = current_user['team_id']

    user_input = (@session_controller.username_by_employee username).first
    role = user_input['role']
    team_id = user_input['team_id']

    if user_input.count.zero?
      puts 'Not find employee !'
      csleep
      cexit
      action_add_member_team
    end

    unless team_id.nil?
      puts 'User there are teams !'
      csleep
      cexit
      action_add_member_team
    end

    if role.zero?
      if @team_controller.add_member(team_current_id, username)
        puts 'Add complete, you want to add more!'
        csleep
        cexit
        action_add_member_team
      end
    else
      puts 'No add leader end system!'
      csleep
      cexit
      action_add_member_team
    end
  end

  def action_show_members_team
    clear
    puts '========= Show All Members Team ========='
    print 'Name team : '
    name_team = gets.chomp
    query = (@team_controller.select_obj_by_team name_team).first
    team_id = query['id']
    members = @team_controller.members(team_id)
    puts 'ID|USERNAME'
    members.each do |e|
      puts e['id'].to_s + '|' + e['username']
    end
  end

  def action_update_team
    clear
    puts '========= Update Team ========='
    puts '1. update name'
    puts '2. update team leader'
    print 'Action : '
    number = begin
               Integer(gets.chomp)
             rescue StandardError
               false
             end
    if number == false
      puts 'input not string !'
      csleep
      cexit
      action_update_team
    end
    action_update_team_name if number == 1
    action_update_team_leader if number == 2
  end

  def action_update_team_name
    clear
    puts '========= Update Name Team ========='
    print 'name team : '
    name_team = gets.chomp
    puts ''
    print 'name team replace : '
    name_replace = gets.chomp

    team = @team_controller.select_obj_by_team name_team

    if team.count.zero?
      puts 'not find team !'
      csleep
      cexit
      action_update_team_name
    end

    if @team_controller.update_name(name_replace, team.to_a[0]['id'])
      puts 'update complete !'
      csleep
      action_team_manager
    else
      puts 'update fail, you try !'
      csleep
      cexit
      action_update_team_name
    end
  end

  def action_update_team_leader
    clear
    puts '========= Update Leader Team ========='
    print 'name team : '
    name_team = gets.chomp
    puts ''
    print 'username up leader : '
    user_up_leader = gets.chomp

    team = @team_controller.select_obj_by_team name_team
    leader_up = @session_controller.username_by_employee user_up_leader

    if team.count.zero? || leader_up.count.zero?
      puts 'not find team end not add leader !'
      csleep
      cexit
      action_update_team_leader
    end
    @team_controller.update_leader(team, leader_up)
  end

  def action_notification_manager
    clear
    account = @session_controller.current_user.first
    team_id = account['team_id']
    role = account['role']

    puts '========= Notification Manager ========='
    puts '1. Send a notification' if role == 2
    puts '2. Read a notification'
    puts '6. Delete a notification' if role == 2
    puts '7. Show list of notification'
    puts '3. Back'
    puts '4. Logout'
    puts '5. Exit program'
    print 'Action : '
    number = begin
               Integer(gets.chomp)
             rescue StandardError
               false
             end

    if number == false
      puts 'input not string !'
      csleep
      cexit
      action_team_manager
    end

    if role == 2
      action_send_notification(team_id) if number == 1
    end

    action_read_notification(team_id) if number == 2
    action_list_notifications(team_id) if number == 7
    action_delete_notification(team_id) if number == 6
    action_logout_back_exit number
  end

  def action_send_notification(team_id)
    clear
    puts '========= Send Notification ========='
    print 'Title : '
    title = gets.chomp
    puts ''
    print 'content : '
    content = gets.chomp
    current_time = Time.new
    notification = Notification.new.tap do |e|
      e.team_id = team_id
      e.title = title
      e.content = content
      e.publish_date = current_time
    end

    if @notification_controller.send notification
      puts 'send notification complete !'
      csleep
      action_notification_manager
    else
      puts 'send notification fail !'
      csleep
      cexit
      action_send_notification
    end
  end

  def action_read_notification(team_id)
    clear
    puts '========= Read Notification ========='
    notification = @notification_controller.read(team_id)
    puts 'TITLE|CONTENT|PUBLISH_DATE'
    notification.each do |e|
      puts e['title'] + '|' + e['content'] + '|' + e['publish_date'].to_s
    end
    csleep
    csleep
    action_notification_manager
  end

  def action_list_notifications(team_id)
    clear
    puts '========= List Notification ========='
    notification = @notification_controller.notifications(team_id)
    puts 'TITLE|CONTENT|PUBLISH_DATE'
    notification.each do |e|
      puts e['title'] + '|' + e['content'] + '|' + e['publish_date'].to_s
    end
    csleep
    csleep
    action_notification_manager
  end

  def action_delete_notification(team_id)
    clear
    puts '========= Delete Notification ========='
    print 'notification id : '
    notification_id = begin
                        Integer(gets.chomp)
                      rescue StandardError
                        false
                      end
    if notification_id == false
      puts 'input id not string !'
      csleep
      cexit
      action_delete_notification(team_id)
    end

    if @notification_controller.id_by_notification(notification_id).count.zero?
      puts 'notification id not find !'
      csleep
      cexit
      action_delete_notification(team_id)
    end

    if @notification_controller.detele(team_id, notification_id)
      puts 'delete notification complete !'
      csleep
      action_notification_manager
    else
      puts 'delete notification fail !'
      csleep
      cexit
      action_delete_notification(team_id)
    end
  end

  def action_csv_manager
    clear
    puts '========= CSV Manager ========='
    puts '1. Import file'
    puts '2. Export file'
    print 'Action : '
    number = begin
               Integer(gets.chomp)
             rescue StandardError
               false
             end

    if number == false
      puts 'input not string !'
      csleep
      cexit
      action_csv_manager
    end

    action_import_csv if number == 1
    action_export_csv if number == 2
  end

  def action_import_csv
    path = 'employee.csv'
    @csv_controller.register_from_csv(path)
  end

  def action_export_csv
    @csv_controller.output_users_to_csv
  end

  def action_leave_manager
    clear
    account = @session_controller.current_user.first
    team_id = account['team_id']
    employee_id = account['id']
    role = account['role']
    puts '========= Leave Manager ========='
    puts '1. Send a leave request'
    puts '2. Show list leaves request need approve' if role == 2
    puts '6. Approve or reject leave request' if role == 2
    puts '7. Update a leave request'
    puts '8. Delete a leave request'
    puts '9. Show list of leaves of employees'
    puts '3. Back'
    puts '4. Logout'
    puts '5. Exit program'
    print 'Action : '
    number = begin
               Integer(gets.chomp)
             rescue StandardError
               false
             end

    if number == false
      puts 'input not string !'
      csleep
      cexit
      action_leave_manager
    end

    action_send_leave(team_id, employee_id) if number == 1
    list_leaves_request_approve if number == 2
    action_approve_leave(team_id) if number == 6
    action_update_leave(team_id, employee_id) if number == 7
    action_delete_leave(team_id, employee_id) if number == 8
    requests_employee_approved if number == 9
    action_logout_back_exit number
  end

  def action_send_leave(team_id, employee_id)
    puts '========= Leave Manager ========='
    print 'reason : '
    reason = gets.chomp
    puts ''
    print 'total date off : '
    total_date_off = begin
                       Integer(gets.chomp)
                     rescue StandardError
                       false
                     end

    leave = Leave.new.tap do |e|
      e.team_id = team_id
      e.employee_id = employee_id
      e.reason = reason
      e.total_date_off = total_date_off
      e.status = 0
      e.publish_date = Time.new
    end

    if @leave_controller.request leave
      puts 'request leave complete !'
      csleep
      action_leave_manager
    else
      puts 'request leave fail !'
      csleep
      cexit
      action_send_leave(team_id)
    end
  end

  def action_approve_leave(team_id)
    puts '========= Approve Leave Manager ========='
    print 'Leave ID :'
    leave_id = begin
                 Integer(gets.chomp)
               rescue StandardError
                 false
               end
    puts 'Approve : '
    puts '1. approve'
    puts '2. rejected'
    print 'Action : '
    approve = begin
                Integer(gets.chomp)
              rescue StandardError
                false
              end

    leave = Leave.new.tap do |e|
      e.id = leave_id
      e.team_id = team_id
      e.status = approve
    end

    if @leave_controller.approve leave
      puts 'approve leave complete !'
      csleep
      action_leave_manager
    else
      puts 'approve leave fail !'
      csleep
      cexit
      action_approve_leave(team_id)
    end
  end

  def action_update_leave(team_id, employee_id)
    puts '========= Update Leave ========='
    print 'Leave ID :'
    id = begin
           Integer(gets.chomp)
         rescue StandardError
           false
         end
    print 'reason : '
    reason = gets.chomp
    puts ''
    print 'total date off : '
    total_date_off = begin
                       Integer(gets.chomp)
                     rescue StandardError
                       false
                     end

    leave = Leave.new.tap do |e|
      e.id = id
      e.team_id = team_id
      e.employee_id = employee_id
      e.reason = reason
      e.total_date_off = total_date_off
      e.status = 0
    end

    if @leave_controller.update leave
      puts 'update leave complete !'
      csleep
      action_leave_manager
    else
      puts 'update leave fail !'
      csleep
      cexit
      action_update_leave(team_id, employee_id)
    end
  end

  def action_delete_leave(team_id, employee_id)
    puts '========= Delete Leave ========='
    print 'Leave ID :'
    id = begin
           Integer(gets.chomp)
         rescue StandardError
           false
         end

    leave = Leave.new.tap do |e|
      e.id = id
      e.team_id = team_id
      e.employee_id = employee_id
    end

    if @leave_controller.delete leave
      puts 'delete leave complete !'
      csleep
      action_leave_manager
    else
      puts 'delete leave fail !'
      csleep
      cexit
      action_delete_leave(team_id, employee_id)
    end
  end

  def list_leaves_request_approve
    leaves = @leave_controller.show_leaves(0)
    puts 'REASON|TOTAL DATE OFF|PUBLISH_DATE'
    leaves.each do |e|
      puts e['reason'] + '|' + e['total_date_off'].to_s + '|' + e['publish_date'].to_s
    end
  end

  def requests_employee_approved
    leaves = @leave_controller.show_leaves(1)
    puts 'REASON|TOTAL DATE OFF|PUBLISH_DATE'
    leaves.each do |e|
      puts e['reason'] + '|' + e['total_date_off'].to_s + '|' + e['publish_date'].to_s
    end
  end

  def action_logout_back_exit(number)
    action_after_login if number == 3
    exit(true) if number == 5
    if number == 4
      @session_controller.logout
      action_login
    end
  end

  def clear
    system('clear')
  end

  def csleep
    sleep 2
  end

  def cexit
    clear
    puts '========= (Try/Exit) ========='
    puts '1. try'
    puts '2. exit'
    print 'Action : '
    number = begin
               Integer(gets)
             rescue StandardError
               false
             end
    exit(true) if number == 2
  end
end

Main.new
