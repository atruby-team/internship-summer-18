require_relative '../config/db'
require 'bcrypt'
$session = {}

class SessionController
  def initialize
    @db = Db.new
    @connect = @db.connect
    @db.select_db
  end

  def login(obj)
    if user_password_by_employee(obj.username, obj.password)
      $session[:username] = obj.username
    else
      return false
    end
    true
  end

  def logout
    if $session.key?(:username)
      $session.delete(:username)
      return true
    end
    false
  end

  def register(obj)
    if username_by_employee(obj.username).count.zero?
      obj.password = SessionController.digest(obj.password)
      statement = @connect.prepare('INSERT INTO employee (name, role, username, password, leave_balance) VALUES (?, ?, ?, ?, ?)')
      statement.execute(obj.name, obj.role, obj.username,
                        obj.password, obj.leave_balance)
      return true
    end
    false
  end

  def current_user
    @current_user ||= username_by_employee($session[:username])
  end

  def username_by_employee(username)
    @connect.query("SELECT * FROM employee WHERE username = '#{username}'")
  end

  def user_password_by_employee(username, password)
    query = username_by_employee(username).first
    return SessionController.authenticate(password, query['password']) unless query.nil?
    false
  end

  def forgot_password(obj)
    unless username_by_employee(obj.username).count.zero?
      statement = @connect.prepare('UPDATE employee SET password = ? WHERE username = ?')
      return !statement.execute(obj.password, obj.username)
    end
    false
  end

  class << self
    def digest(string)
      BCrypt::Password.create(string)
    end

    def authenticate(password, input)
      BCrypt::Password.new(input) == password
    end
  end
end
