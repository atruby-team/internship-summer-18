class Team < ApplicationRecord
  after_create :create_teams_users
  has_many :teams_users
  has_many :users, through: :teams_users

  def create_teams_users
    TeamsUser.create(user_id: self.leader_id, team_id: self.id)
  end

  def user
    User.find(self.leader_id)
  end
end
