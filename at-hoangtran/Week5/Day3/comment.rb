class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :increase_comments_count

  def increase_comments_count
    User.find_by(self.user_id).increment!(:comments_count)
    Post.find_by(self.post_id).increment!(:comments_count)
  end
end
