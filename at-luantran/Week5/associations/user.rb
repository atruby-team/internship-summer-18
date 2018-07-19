class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :teams_users
  has_many :teams, through: :teams_users

  validates :address, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, length: { minimum: 10, maximmum: 15 },
                           numericality: true
  validates_inclusion_of :gender, in: 0..2
  scope :get_male, -> { where(gender: 1) }
  scope :get_female, -> { where(gender: 0) }
  scope :get_dir, -> { where(gender: 2) }

  def post_comments
    arr = []
    Post.where(user_id: self.id).each do |x|
      arr.push(x)
    end
    arr.flatten
  end

  def post_comments_2
    arr_id = []
    Post.where(user_id: self.id).each do |x|
      arr_id.push(x.id)
    end
    Comment.where('post_id IN (?)', arr_id)
  end

  def leader
    arr_id_team = []
    TeamsUser.where(user_id: self.id).each do |x|
      arr_id_team.push(x.team_id)
    end
    Team.where('id IN (?)', arr_id_team)
  end
end
