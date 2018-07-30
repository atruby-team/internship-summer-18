class Comment < ApplicationRecord
  after_create :update_comment
  belongs_to :user
  belongs_to :post

  def update_comment
    Post.find(self.post_id).increment!(:comments_count)
    User.find(self.user_id).increment!(:comments_count)
  end
end
