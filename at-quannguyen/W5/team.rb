class Team < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :leader_id
  has_and_belongs_to_many :users

  def users_by_team
    self.users
  end

  def leader_team
    self.user
  end
end
