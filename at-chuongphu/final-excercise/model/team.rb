class Team
  attr_accessor :id, :name, :team_lead, :total_member
  def initialize(id, name, team_lead, total_member)
    self.id = id
    self.name = name
    self.team_lead = team_lead
    self.total_member = total_member
  end
end
