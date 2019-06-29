require_relative '../config/db'
class TeamController
  def initialize
    @db = Db.new
    @connect = @db.connect
    @db.select_db
  end

  def new(obj)
    statement = @connect.prepare('INSERT INTO team (name, employee_id)
      VALUES (?, ?)')
    statement.execute(obj.name, obj.employee_id)
    team_id = id_last_insert
    update_employee_leader(obj.employee_id, team_id)
  end

  def update_employee_leader(user_id, team_id)
    statement = @connect.prepare('UPDATE employee SET team_id = ?, role = 2
      WHERE id = ?')
    !statement.execute(team_id, user_id)
  end

  def add_member(team_id, username)
    statement = @connect.prepare('UPDATE employee SET team_id = ?
      WHERE username = ?')
    !statement.execute(team_id, username)
  end

  def update_name(name, id)
    statement = @connect.prepare('UPDATE team SET name = ?
      WHERE id = ?')
    !statement.execute(name, id)
  end

  def update_leader(team, leader_up)
    leader_up = leader_up.first
    team = team.first
    remove_member_out_team team
    update_leader_after_remove(team, leader_up)
    update_employee_leader(leader_up['id'], team['id'])
  end

  def remove_member_out_team(team)
    team = team.first
    leader_id = team['employee_id']
    statement = @connect.prepare('UPDATE employee SET team_id = ?, role = ?
      WHERE id = ?')
    !statement.execute(nil, 0, leader_id)
  end

  def update_leader_after_remove(team, leader_up)
    team_id = team['id']
    leader_id = leader_up['id']
    statement = @connect.prepare('UPDATE team SET employee_id = ?
      WHERE id = ?')
    !statement.execute(leader_id, team_id)
  end

  def members(team_id)
    @connect.query("SELECT * FROM employee WHERE team_id = #{team_id}")
  end

  def select_obj_by_team(name)
    @connect.query("SELECT * FROM team WHERE name = '#{name}'")
  end

  def id_last_insert
    last = @connect.query('SELECT LAST_INSERT_ID();').first
    last['LAST_INSERT_ID()']
  end
end
