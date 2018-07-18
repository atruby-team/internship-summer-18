require './controllers/session_controller'
require './controllers/team_controller'
require './controllers/notification_controller'
require './controllers/leave_controller'
require 'pry'

def screen1
  loop do
    p '============ Human Resource ============='
    p '1. Login'
    p '2. Register'
    p '3. Forgot Password'
    p '4. Exit'
    p 'Choose number:'
    x = gets.chomp.to_i
    case x
    when 1
      @user = SessionController.new.login
      if @user
        system('clear')
        p "WELCOME #{@user.username}"
        screen2
      else
        p 'Invalid username or password!!!'
      end
    when 2
      SessionController.new.register
    when 3
      SessionController.new.forgot_password
    when 4
      exit!
    else
      system('clear')
      p '=====>Notice! :Choose number 1-> 4'
    end
  end
end

def screen2
  loop do
    p '============ Human Resource Management ============='
    p '1. Team management'
    p '2. Leave management'
    p '3. Notification management'
    p '4. Logout'
    p '5. Shutdown program'
    p '6.CSV'
    p 'Choose number:'
    x = gets.chomp.to_i
    case x
    when 1
      screen_team
    when 2
      screen_leave
    when 3
      screen_notif
    when 4
      p 'Logout'
      @user = nil
      screen1
    when 5
      exit!
    else
      p '=====>Notice! :Choose number 1-> 6'
    end
  end
end

def screen_team
  system('clear')
  loop do
    p '========== Team Management ==========='
    p '1. Create a new team(only root)'
    p '2. Add a new member(only team lead)'
    p '3. Show list of members'
    p '4. Return: Go to Level 1'
    p '5. Logout: Go to Level 0'
    p '6. Exit: Shutdown program'
    p 'Choose number:'
    x = gets.chomp.to_i
    case x
    when 1
      TeamController.new
      system('clear')
      p 'Create team success!'
    when 2
      TeamController.add_member(@user)
      system('clear')
      p 'Add member success'
    when 3
      TeamController.members(@user)
    when 5
      p 'Logout'
      @user = nil
      screen1
    when 6
      exit!
    else
      p '=====>Notice! :Choose number 1-> 6'
      break if x == 4
    end
  end
end

def screen_notif
  system('clear')
  loop do
    p '========== Notification Management ==========='
    p '1. Send a notification(only team lead)'
    p '2. Read a notification'
    p '3. Delete a notification'
    p '4. Show list of notifications.'
    p '5. Return: Go to Level 1'
    p '6. Logout: Go to Level 0'
    p '7. Exit: Shutdown program'
    p 'Choose number:'
    x = gets.chomp.to_i
    case x
    when 1
      NotificationController.send(@user)
      system('clear')
      p 'Send notification success!'
    when 2
      NotificationController.read(@user)
    when 3
      NotificationController.delete(@user)
      system('clear')
      p 'Delete notification success!'
    when 4
      NotificationController.read(@user)
    when 6
      p 'Logout'
      @user = nil
      screen1
    when 7
      exit!
    else
      p '=====>Notice! :Choose number 1-> 6'
      break if x == 5
    end
  end
end

def screen_leave
  system('clear')
  loop do
    p '========== Leave Management ==========='
    p '1. Send a leave request'
    p '2. Show list leaves request need approve(only team lead)'
    p '3. Approve or reject leave request(only team lead)'
    p '4. Update a leave request'
    p '5. Show list of leaves of employees.'
    p '6. Return: Go to Level 1.'
    p '7. Logout: Go to Level 0.'
    p '8. Exit: Shutdown program.'
    p 'Choose number:'
    x = gets.chomp.to_i
    case x
    when 1
      system('clear')
      if LeaveController.request(@user)
        p 'Send leave request success'
      else
        p 'Error with total day off'
      end
    when 2
      LeaveController.new.show(@user, 'sending')
      p '===================================='
    when 3
      LeaveController.approve(@user, 'sending')
    when 4
      LeaveController.update(@user)
      p 'Update success'
    when 5
      LeaveController.new.list_of_leaves(@user)
      p '===================================='
    when 7
      p 'Logout'
      @user = nil
      screen1
    when 8
      exit!
    else
      p '=====>Notice! :Choose number 1-> 8'
      break if x == 6
    end
  end
end
# Screen level 0
system('clear')
screen1
