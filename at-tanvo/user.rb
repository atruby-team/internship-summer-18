class User < ApplicationRecord
  has_many :teams_users
  has_many :teams, through: :teams_users
  has_many :posts
  has_many :comments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  number_regex = /\d[0-9]\)*\z/
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, length: { maximum: 40 }
  validates :phone_number, format: { with: number_regex }, length: { minimum: 10, maximum: 13 }
  validates :gender, presence: true
  validates_inclusion_of :gender, in: 0..2

  scope :male, -> { where(gender: 0) }
  scope :female, -> { where(gender: 1) }
  scope :gioi_tinh_khac, -> { where(gender: 2) }

  def posts_user
    self.posts
  end

  def comments_user
    self.comments
  end

  def posts_comments
    Comment.where('post_id IN (?)', self.post_ids)
  end

  def leader_users
    arr = []
    self.teams.each do |n|
      arr << n[:user_id]
    end
    User.where('id IN (?)', arr)
  end
end
