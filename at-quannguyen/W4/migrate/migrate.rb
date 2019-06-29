require '../controllers/session_controller.rb'

class Migrate
  def initialize
    @db = Db.new
    @query = @db.connect
  end

  def create
    @query.query("DROP DATABASE IF EXISTS #{@db.database}")
    @query.query("CREATE DATABASE #{@db.database}")
  end

  def drop
    @query.query("DROP DATABASE IF EXISTS #{@db.database}")
  end

  def create_table_team
    sql = '
      CREATE TABLE team (
        id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name NVARCHAR(150),
        employee_id INT(11)
      )
    '
    @query.query(sql)
  end

  def create_table_employee
    sql = '
      CREATE TABLE employee (
        id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        team_id INT(11),
        name NVARCHAR(150),
        role INT(11),
        username VARCHAR(150),
        password VARCHAR(250),
        leave_balance INT(11)
      )
    '
    @query.query(sql)
  end

  def create_table_notification
    sql = '
      CREATE TABLE notification (
        id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        team_id INT(11),
        title NVARCHAR(150),
        content NVARCHAR(150),
        publish_date DATETIME
      )
    '
    @query.query(sql)
  end

  def create_table_leave
    sql = '
      CREATE TABLE leaves (
        id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        team_id INT(11),
        employee_id INT(11),
        reason NVARCHAR(150),
        total_date_off INT(11),
        status INT(11),
        publish_date DATETIME
      )
    '
    @query.query(sql)
  end

  def create_admin_system
    sql = '
      INSERT INTO employee (name, role, username, password, leave_balance)
        VALUES (?, ?, ?, ?, ?)
    '
    password = SessionController.digest('123456')
    statement = @query.prepare(sql)
    statement.execute('System', 1, 'admin', password, 0)
  end

  def create_table
    @db.select_db
    create_table_team
    create_table_employee
    create_table_notification
    create_table_leave
    create_admin_system
  end

  def run_all
    create
    create_table
    @query.close
  end
end

Migrate.new.run_all
