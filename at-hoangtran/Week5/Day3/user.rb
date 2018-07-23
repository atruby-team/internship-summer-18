class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :teams_users
  has_many :teams, through: :teams_users

  before_save { email.downcase! }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX }
  validates :phone_number, presence: true, uniqueness: true,
                           length: { maximum: 15 },
                           format: { with: PHONE_REGEX }, numericality: true
  validates_inclusion_of :gender, in: 0..2, presence: true

  scope :male, -> { where(gender: 0) }
  scope :female, -> { where(gender: 1) }
  scope :other, -> { where(gender: 2) }

  def all_comments
    self.comments
  end

  def all_post
    self.posts
  end

  def comments_posts
    Comment.where('post_id IN (?)', self.posts.id)
  end

  def leaders
    leaders_id = []
    self.team.each do |t|
      leaders_id << t[:user_id]
    end
    User.where('user_id IN (?)', leaders_id)
  end
end
