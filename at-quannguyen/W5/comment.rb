class Comment < ApplicationRecord
  after_save :increment_count_comment
  belongs_to :post
  belongs_to :user

  def increment_count_comment
    increment_count_post
    increment_count_user
  end

  def increment_count_post
    self.user.increment!(:comment_count)
  end

  def increment_count_user
    self.post.increment!(:comment_count)
  end
end
