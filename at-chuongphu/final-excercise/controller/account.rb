require_relative '../config/connect'
class AccountController
  def intialize
    @db = Database.new
    @connect = @db.connect
    @db.use_db
  end

  def register(acc)
    statement = @connect.prerpare('INSERT INTO employee (name, role, username, password, leave balance)')
    statement.execute(acc.name, acc.role, acc.username, acc.password, acc.leave_balance)
  end