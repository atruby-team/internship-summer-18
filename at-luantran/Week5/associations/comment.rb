class Comment < ApplicationRecord
  after_create :update_comments_in_post
  after_create :update_comments_in_user
  belongs_to :post
  belongs_to :user

  def update_comments_in_post
    Post.find(self.post_id).increment(:comments_count)
  end

  def update_comments_in_user
    User.find(self.user_id).increment(:comments_count)
  end
end
