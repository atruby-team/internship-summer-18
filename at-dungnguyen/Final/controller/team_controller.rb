Dir['../model/*.rb'].each { |file| require file }
require 'pry'
class TeamController
  def add_team
    p 'Team name: '
    name = gets.chomp
    p 'Team lead: '
    id_leader = Integer(gets)
    team = Team.new(name, id_leader, 1)
    Team.create(team)
    Team.add_leader(id_leader, Team.last.first['id'])
    p 'Create Team Sucesss'
    p '========================================'
    puts
  rescue StandardError
    p 'Input id employee for Team Lead or exist'
  end

  def add_member(id_team)
    p 'ID Employee'
    id_employee = Integer(gets)
    Team.add_member(id_employee, id_team)
    Team.update_members(id_team)
    p 'Add Success'
    puts
  rescue StandardError
    p 'Add Error'
  end

  def members(id_team)
    Team.members(id_team)
  end
end
