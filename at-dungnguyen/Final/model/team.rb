class Team
  attr_reader :id
  attr_accessor :name, :team_lead, :total_members

  def self.add_team(team)
    @client.query('INSERT INTO team(name, team_lead, total_of_members) VALUES (team.name, team.team_lead, 0)')
  end
end
