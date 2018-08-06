require './Migrate/connect_db'
require './Models/team_model'
require 'pry'
class TeamController
  def self.add_team
    print 'Team Name: '
    team_name = gets.chomp
    print 'Team Lead Id: '
    team_lead_id = gets.chomp
    print 'Total Member: '
    total_member = gets.chomp
    result = $client.query("INSERT INTO Team (name, employee_id, total_member) VALUES ('#{team_name}', '#{team_lead_id}', '#{total_member}')")
  end

  def self.add_member(team_id)
    print 'ID Employee'
    employee_id = gets.chomp
  end

  def self.choose_team
    result = $client.query('SELECT * FROM Team')
    @team = query.to_a
  end

  def self.show_team; end

  def self.show_member
    result = $client.query('SELECT * ')
  end
end
TeamController.add_member
