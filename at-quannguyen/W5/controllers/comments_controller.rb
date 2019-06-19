require_relative '../config/db'
require_relative '../models/comment'
require_relative '../controllers/posts_controller'

class CommentsController
  def initialize
    @db = Db.new
    @connect = @db.connect
    @db.select_db
  end

  def add(params)
    comment = Comment.new.tap do |e|
      e.content = params[:content]
      e.post_id = params[:post_id]
    end
    statement = @connect.prepare('INSERT INTO comments (content, post_id) VALUES (?, ?)')
    statement.execute(comment.content, comment.post_id)
    PostsController.new.update_comment_count(get_count(comment.post_id),
                                             comment.post_id)
  end

  def delete(params)
    post = get_comment_by_id params[:id]
    statement = @connect.prepare('DELETE FROM comments WHERE id = ?')
    statement.execute(params[:id])
    PostsController.new.update_comment_count(get_count(post['post_id']),
                                             post['post_id'])
  end

  def get_comment_by_id(id)
    @connect.query("SELECT * FROM comments WHERE id = #{id}").first
  end

  def get_count(post_id)
    result = @connect.query("SELECT COUNT(*) as total FROM comments
                            WHERE post_id = #{post_id}").first
    result['total']
  end

  def delete_comments_by_post(post_id)
    statement = @connect.prepare('DELETE FROM comments
                                  WHERE post_id = ?')
    !statement.execute(post_id)
  end
end
