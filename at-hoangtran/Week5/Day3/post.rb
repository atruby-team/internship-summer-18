class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def all_comments_of_post
    self.comments
  end
end
