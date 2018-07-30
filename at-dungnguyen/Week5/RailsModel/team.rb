class Team < ApplicationRecord
  belongs_to :user
  has_many :teams_users
  has_many :users, through: :team_users

  after_save :add_leader

  def add_leader
    TeamsUser.create(team_id: self.id, user_id: self.user_id)
  end
end
