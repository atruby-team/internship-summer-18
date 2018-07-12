require './models/employee.rb'
require './models/team.rb'
require 'pry'

class TeamController
  def initialize
    team_lead = Employee.new.get_team_lead
    id_lead = 0
    arr_id = []
    name = ''
    loop do
      system('clear')
      p "=========Create Team========="
      p "Enter name team:"
      name = gets.chomp
      p "List leader no position:"
      team_lead.each do |x| 
        p "#{x['id']}. #{x['name']}"
        arr_id .push(x['id'])
      end
      p "Choose leader:"
      id_lead = gets.chomp.to_i
      break if arr_id.include? id_lead
    end
    result = Team.new.create_team(name, id_lead)
    id_team = Team.new.get_id
    Employee.new.update_team(id_lead, id_team)
  end
  def add_member
    
  end

  def update
    
  end

  def members
  end
end