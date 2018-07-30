class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :increment_comments_count

  def increment_comments_count
    User.find(self.user_id).increment!(:comments_count)
    Post.find(self.post_id).increment!(:comments_count)
  end
end
