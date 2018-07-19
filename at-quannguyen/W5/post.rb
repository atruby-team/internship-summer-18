class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def all_comments_by_post
    self.comments
  end
end
