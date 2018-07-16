require_relative '../config/db'
class CsvController
  def initialize
    @db = Db.new
    @connect = @db.connect
    @db.select_db
  end

  def register_from_csv(file)
    CSV.foreach(file, headers: true) do |row|
      insert_employee(row[1], row[2], row[3], row[4], row[5], row[6])
    end
  end

  def output_users_to_csv
    query = query_all_employee.to_a
    CSV.open('employee.csv', 'w') do |csv|
      csv << ['ID', 'TEAM ID', 'NAME', 'ROLE', 'USERNAME',
              'PASSWORD', 'LEAVE BALANCE']
      query.each do |e|
        csv << [e['id'], e['team_id'], e['name'], e['role'], e['username'], e['password'], e['leave_balance']]
      end
    end
  end

  def insert_employee(*input)
    statement = @connect.prepare('INSERT INTO employee (team_id, name, role, username, password, leave_balance)
      VALUES (?, ?, ?, ?, ?, ?)')
    !statement.execute(input[0].to_i, input[1], input[2].to_i, input[3], input[4], input[5].to_i)
  end

  def query_all_employee
    @connect.query('SELECT * FROM employee')
  end
end
