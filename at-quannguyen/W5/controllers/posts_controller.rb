require_relative '../config/db'
require_relative '../models/post'
require_relative '../controllers/comments_controller'

class PostsController
  def initialize
    @db = Db.new
    @connect = @db.connect
    @db.select_db
  end

  def index(params)
    limit = 2
    total_records = posts_count
    current_page = (params[:page] || 1).to_i
    total_page = (total_records.to_f / limit).ceil
    if current_page > total_page
      current_page = total_page
    elsif current_page < 1
      current_page = 1
    end
    start = (current_page - 1) * limit
    posts = @connect.query("SELECT * FROM posts LIMIT #{start}, #{limit}")
    [posts.to_a, current_page, total_page]
  end

  def show(params)
    post = @connect.query("SELECT * FROM posts INNER JOIN users
      ON posts.user_id = users.id WHERE posts.id = #{params[:id]}").first
    comments = @connect.query("SELECT * FROM comments
      WHERE post_id = #{params[:id]}").to_a
    [post, comments]
  end

  def add(params)
    post = Post.new.tap do |e|
      e.content = params[:content]
      e.user_id = params[:user_id]
      e.comment_count = 0
    end
    statement = @connect.prepare('INSERT INTO posts (content, user_id, comment_count) VALUES (?, ?, ?)')
    !statement.execute(post.content, post.user_id, post.comment_count)
  end

  def update(params)
    post = Post.new.tap do |e|
      e.id = params[:id]
      e.content = params[:content]
    end
    statement = @connect.prepare('UPDATE posts SET content = ? WHERE id = ?')
    !statement.execute(post.content, post.id)
  end

  def delete(params)
    statement = @connect.prepare('DELETE FROM posts
      WHERE id = ?')
    statement.execute(params[:id])
    CommentsController.new.delete_comments_by_post params[:id]
  end

  def update_comment_count(count, id)
    statement = @connect.prepare('UPDATE posts SET comment_count = ? WHERE id = ?')
    !statement.execute(count, id)
  end

  private

    def posts_count
      result = @connect.query('SELECT COUNT(*) as total FROM posts').first
      result['total']
    end
end
