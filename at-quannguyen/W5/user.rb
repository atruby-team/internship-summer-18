class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_GENDER_REGEX = /\A[1-3]+\z/

  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :gender, presence: true, format: { with: VALID_GENDER_REGEX }
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 13 }, numericality: { only_integer: true }

  has_many :posts, dependent: :destroy
  has_many :comments
  has_and_belongs_to_many :teams

  scope :get_gender_by_user, ->(input) { where gender: input }

  def all_posts_by_user
    self.posts
  end

  def all_comments_by_user
    self.comments
  end

  def all_comments_in_posts_by_user
    user_id = self.posts.all.map(&:id)
    Comment.where('post_id in (?)', user_id)
  end

  def add_user_to_team(team_id)
    self.teams << Team.find(team_id)
  end

  def all_leader_by_team
    leader_id = self.teams.all.map(&:leader_id)
    User.where('id in (?)', leader_id)
  end
end
