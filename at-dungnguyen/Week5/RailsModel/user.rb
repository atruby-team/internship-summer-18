class User < ApplicationRecord
  before_save { email.downcase! }

  has_many :teams_users
  has_many :teams, through: :teams_users
  has_many :comments
  has_many :posts

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 13 }, format: { with: PHONE_REGEX }
  validates :gender, length: { in: 0..2 }, numericality: { only_integer: true }

  scope :male, -> { where(gender: 0) }
  scope :famale, -> { where(gender: 1) }
  scope :gay_or_les, -> { where(gender: 2) }

  def post_comments
    Comment.where('post_id IN (?)', self.posts.ids)
  end

  def leaders
    leader_ids = []
    self.teams.each do |t|
      leader_ids << t[:user_id]
    end
    User.where('id IN (?)', leader_ids)
  end
end
