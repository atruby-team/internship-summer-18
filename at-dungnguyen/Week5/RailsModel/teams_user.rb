class TeamsUser < ApplicationRecord
  after_save :increment_members_count
  belongs_to :user
  belongs_to :team

  def increment_members_count
    Team.find(self.team_id).increment!(:members_count)
  end
end
