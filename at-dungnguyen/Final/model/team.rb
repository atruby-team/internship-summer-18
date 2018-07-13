require 'mysql2'
require 'pry'
class Team
  attr_reader :id
  attr_accessor :name, :team_lead, :total_members
  @@client = Mysql2::Client.new(host: '127.0.0.1', username: 'root', password: 'win112344', database: 'DungNguyen_HumanResources')

  def initialize(name, team_lead, total_members)
    @name = name
    @team_lead = team_lead
    @total_members = total_members
  end

  def self.create(team)
    sql = "INSERT INTO `DungNguyen_HumanResources`.`team`(name, team_lead, total_members) VALUES ('#{team.name}', '#{team.team_lead}', 1)"
    @@client.query(sql)
  end

  def self.add_member(id_employee, id_team)
    sql = "UPDATE `DungNguyen_HumanResources`.`employee` SET team = '#{id_team}' WHERE id = '#{id_employee}'"
    @@client.query(sql)
  end

  def update_members(id_team)
    sql = "UPDATE `DungNguyen_HumanResources`.`team` SET total_members = total_members + 1 WHERE id = '#{id_team}'"
    @@client.query(sql)
  end

  def self.members(id_team)
    sql = "SELECT * FROM `DungNguyen_HumanResources`.`employee` WHERE team = '#{id_team}'"
    @@client.query(sql)
  end

  def self.last
    sql = 'SELECT MAX(id) as id FROM `DungNguyen_HumanResources`.`team`'
    @@client.query(sql)
  end

  def self.add_leader(id_employee, id_team)
    sql = "UPDATE `DungNguyen_HumanResources`.`employee` SET team = '#{id_team}',  role = 1 WHERE id = '#{id_employee}'"
    @@client.query(sql)
  end
end
