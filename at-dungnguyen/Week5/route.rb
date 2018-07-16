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
  sql = "SELECT * FROM posts ORDER BY id DESC LIMIT #{offset}, #{row_count}"
  @posts = client.query(sql).to_a
  erb :index_posts
end

get '/posts/:id' do
  sql = "SELECT * FROM posts WHERE id = #{params[:id]}"
  sql2 = "SELECT * FROM comments WHERE post_id = #{params[:id]}"
  @post = client.query(sql).first
  @comments = client.query(sql2).to_a
  sql3 = "SELECT * FROM users WHERE id = #{@post['user_id']}"
  @user = client.query(sql3).first
  erb :detail_posts
end

post '/posts' do
  sql = "INSERT INTO posts(content, user_id, comment_count) VALUES('#{params[:content]}', #{params[:user_id]}, 0)"
  client.query(sql)
end

delete '/posts/:id' do
  sql = "DELETE FROM posts WHERE id = #{params[:id]}"
  sql2 = "DELETE FROM comments WHERE post_id = #{params[:id]}"
  client.query(sql)
  client.query(sql2) if client.affected_rows > 0
end

put '/posts/:id' do
  sql = "UPDATE posts SET content = '#{params[:content]}' WHERE id = #{params[:id]}"
  client.query(sql)
end

post '/posts/:id/comments' do
  sql = "INSERT INTO comments(content, post_id) VALUES('#{params[:content]}', #{params[:id]})"
  client.query(sql)
  sql2 = "UPDATE posts SET comment_count = comment_count + 1 WHERE id = #{params[:id]}"
  client.query(sql2) if client.affected_rows > 0
end

delete '/posts/:id/comments/:cmt_id' do
  sql = "DELETE FROM comments WHERE id = #{params[:cmt_id]}"
  client.query(sql)
  sql2 = "UPDATE posts SET comment_count = comment_count - 1 WHERE id = #{params[:id]}"
  client.query(sql2) if client.affected_rows > 0
end
