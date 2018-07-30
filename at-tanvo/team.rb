class Team < ApplicationRecord
  belongs_to :user, :class_name => "User", :foreign_key => "leader_id"
  has_many :teams_users
  has_many :users, through: :teams_users 

  validates :name, presence :true
end
