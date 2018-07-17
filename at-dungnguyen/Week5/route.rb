require 'sinatra'
require 'mysql2'
require 'pry'

client = Mysql2::Client.new(host: '127.0.0.1', username: 'root', password: 'win112344', database: 'dungnguyen_sinatra')

get '/posts' do
  page = params[:page] ? params[:page].to_i : 1
  row_count = 10
  offset = (page - 1) * row_count

  total_posts = 'SELECT COUNT(*) AS total FROM posts'
  total = client.query(total_posts).first['total']

  @total_pages = (total.to_f / row_count).ceil
  top_10_post_newest = "SELECT * FROM posts ORDER BY id DESC LIMIT #{offset}, #{row_count}"
  @posts = client.query(top_10_post_newest).to_a
  erb :index_posts
end

get '/posts/:id' do
  post = "SELECT * FROM posts WHERE id = #{params[:id]}"
  comments = "SELECT * FROM comments WHERE post_id = #{params[:id]}"
  @post = client.query(post).first
  @comments = client.query(comments).to_a
  writer = "SELECT * FROM users WHERE id = #{@post['user_id']}"
  @user = client.query(writer).first
  erb :detail_posts
end

post '/posts' do
  add_post = "INSERT INTO posts(content, user_id, comment_count) VALUES('#{params[:content]}', #{params[:user_id]}, 0)"
  client.query(add_post)
end

delete '/posts/:id' do
  del_post = "DELETE FROM posts WHERE id = #{params[:id]}"
  del_comments = "DELETE FROM comments WHERE post_id = #{params[:id]}"
  client.query(del_post)
  client.query(del_comments) if client.affected_rows > 0
end

put '/posts/:id' do
  update_content = "UPDATE posts SET content = '#{params[:content]}' WHERE id = #{params[:id]}"
  client.query(update_content)
end

post '/posts/:id/comments' do
  add_comment = "INSERT INTO comments(content, post_id) VALUES('#{params[:content]}', #{params[:id]})"
  client.query(add_comment)
  update_count = "UPDATE posts SET comment_count = comment_count + 1 WHERE id = #{params[:id]}"
  client.query(update_count) if client.affected_rows > 0
end

delete '/posts/:id/comments/:cmt_id' do
  del_comment = "DELETE FROM comments WHERE id = #{params[:cmt_id]}"
  client.query(del_comment)
  update_count = "UPDATE posts SET comment_count = comment_count - 1 WHERE id = #{params[:id]}"
  client.query(update_count) if client.affected_rows > 0
end
