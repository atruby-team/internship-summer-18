require 'sinatra'
require 'mysql2'
require 'pry'
client = Mysql2::Client.new(host: 'localhost', username: 'root', password: 'huyhoang1')

get '/posts' do
  limit = 10
  page = params[:page] ? params[:page].to_i : 1
  offset = (page - 1) * limit
  total_record = 'SELECT COUNT(*) AS total FROM Post.posts'
  total = client.query(total_record).first['total']
  @total_pages = (total.to_f / limit).ceil
  sql = "SELECT * FROM Post.posts LIMIT #{offset}, #{limit}"
  @posts = client.query(sql).to_a
  erb :post
end

get 'posts/:id' do
  sql1 = "SELECT * FROM Post.posts WHERE post_id = #{params[:id]}"
  sql2 = "SELECT * FROM Post.comments WHERE post_id = #{params[:id]}"
  @post_detail = client.query(sql1).first
  @comments = client.query(sql2).to_a
  sql3 = "SELECT * FROM Post.users WHERE user_id = #{@post_detail['user_id']}"
  @user = client.query(sql3).first
  erb :post_detail
end

post '/posts' do
  sql = "INSERT INTO Post.posts(content, user_id, comment_count) VALUES ('#{params[:content]}', #{params[:user_id]}, 0)"
  client.query(sql)
end

put 'posts/:id' do
  sql = "UPDATE Post.post SET content = '#{params[:content]}' WHERE post_id = #{params[:id]}"
  client.query(sql)
end

delete 'posts/:id' do
  sql1 = "DELETE FROM Post.posts WHERE post_id = #{params[:id]}"
  sql2 = "DELETE FROM Post.comments WHERE post_id = #{params[:id]}"
  client.query(sql1)
  client.query(sql2) if client.affected_rows > 0
end

post 'posts/:id/comments/' do
  sql1 = "INSERT INTO Post.comments(content, post_id) VALUES('#{params[:content]}', #{params[:id]})"
  client.query(sql1)
  sql2 = "UPDATE Post.post SET comment_count = comment_count + 1 WHERE post_id = #{params[:id]}"
  client.query(sql2) if client.affected_rows > 0
end

delete 'posts/:id/comments/:comment_id' do
  sql1 = "DELETE FROM Post.comments WHERE comment_id = #{params[:comment_id]}"
  client.query(sql1)
  sql2 = "UPDATE Post.posts SET comment_count = comment_count - 1 WHERE post_id = #{params[:id]}"
  client.query(sql2) if client.affected_rows > 0
end
