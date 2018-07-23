class Team < ApplicationRecord
  belongs_to :user
  has_many :team_users
  has_many :users, through: :team_users

  def all_user_of_team
    self.users
  end

  def leader_of_team
    self.user
  end

  def add_leader
    TeamUser.create!(team_id: self.id, user_id: self.user_id)
  end
end
