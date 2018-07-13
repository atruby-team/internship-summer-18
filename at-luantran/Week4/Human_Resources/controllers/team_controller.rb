require './models/employee.rb'
require './models/team.rb'
require 'pry'

class TeamController
  def initialize
    team_lead = Employee.new.get_employee('team_lead')
    id_lead = 0
    arr_id = []
    id_team = 0
    name = ''
    loop do
      system('clear')
      p '=========Create Team========='
      p 'Enter name team:'
      name = gets.chomp
      p 'List leader no position:'
      team_lead.each do |x|
        p "#{x['id']}. #{x['name']}"
        arr_id .push(x['id'])
      end
      p 'Choose leader:'
      id_lead = gets.chomp.to_i
      break if arr_id.include? id_lead
    end
    Team.new.create_team(name, id_lead)
    Team.new.get_id_max.each do |x|
      id_team = x.values.first
    end
    Employee.new.update_team(id_lead, id_team)
  end

  def self.add_member(user)
    id_member = 0
    arr_id = []
    member = Employee.new.get_employee('team_member')
    loop do
      system('clear')
      p '=========Add Team Member========='
      p 'List member no position:'
      member.each do |x|
        p "#{x['id']}. #{x['name']}"
        arr_id .push(x['id'])
      end
      p 'Choose member:'
      id_member = gets.chomp.to_i
      break if arr_id.include? id_member
    end
    Employee.new.update_team(id_member, user.id_team)
    Team.new.update_member(user.id_team)
  end

  def update; end

  def self.members(user)
    system('clear')
    result = Employee.new.get_member_team(user.id_team)
    p '=========== List member ============'
    result.each do |x|
      p "#{x['id']}. #{x['name']}"
    end
  end
end
