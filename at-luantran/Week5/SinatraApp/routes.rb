require 'sinatra'
require 'mysql2'
require 'pry'

connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                             password: 'hoichuphong513')

get '/posts' do
  get_total_posts = 'SELECT count(*) as total FROM `LuanTran_Sinatra`.posts'
  total_post = connect.query(get_total_posts).to_a[0]['total']
  limit = 10
  @total_pages = (total_post.to_f / limit).ceil
  current_page = params['page'] ? params['page'].to_i : 1
  start = (current_page - 1) * limit
  get_posts = "SELECT * FROM `LuanTran_Sinatra`.posts ORDER BY id DESC LIMIT #{start}, #{limit}"
  @posts = connect.query(get_posts).to_a
  erb :index
end

get '/posts/:id' do
  id_post = params['id']
  get_post = "SELECT * FROM `LuanTran_Sinatra`.posts WHERE id = #{id_post}"
  get_cm = "SELECT * FROM `LuanTran_Sinatra`.comments WHERE post_id = #{id_post}"
  @post = connect.query(get_post).first
  @comments = connect.query(get_cm).to_a
  id_user = @post['user_id']
  get_author = "SELECT * FROM `LuanTran_Sinatra`.users WHERE id = #{id_user}"
  @author = connect.query(get_author).first
  erb :detail
end

post '/posts/add' do
  user_id = params['user_id']
  content = params['content']
  add_post = "INSERT INTO `LuanTran_Sinatra`.`posts` (`content`,
              `user_id`, `comment_count`) VALUES ('#{content}', #{user_id}, 0);"
  connect.query(add_post)
  redirect '/posts'
end

put '/posts/edit/:id' do
  id = params['id']
  user_id = params['user_id']
  content = params['content']
  edit_post = "UPDATE `LuanTran_Sinatra`.`posts` SET content = '#{content}', user_id = #{user_id} WHERE id = #{id}"
  p edit_post
  connect.query(edit_post)
  redirect '/posts'
end

delete '/posts/:id' do
  id = params['id']
  del_post = "DELETE FROM `LuanTran_Sinatra`.`posts` WHERE id = #{id}"
  del_cm = "DELETE FROM `LuanTran_Sinatra`.`comments` WHERE post_id = #{id}"
  connect.query(del_post)
  connect.query(del_cm)
  redirect '/posts'
end

post '/posts/:id/comments' do
  post_id = params['id']
  content = params['content']
  add_comment = "INSERT INTO `LuanTran_Sinatra`.`comments` (`content`,
              `post_id`) VALUES ('#{content}', #{post_id});"
  count_comment = "UPDATE `LuanTran_Sinatra`.`posts` SET comment_count = comment_count + 1 WHERE id = #{post_id}"
  p count_comment
  connect.query(add_comment)
  connect.query(count_comment)
  redirect  '/posts'
end

delete '/posts/:id/comments/:id_cm' do
  post_id = params['id']
  comment_id = params['id_cm']
  del_cm = "DELETE FROM `LuanTran_Sinatra`.`comments` WHERE id = #{comment_id}"
  count_comment = "UPDATE `LuanTran_Sinatra`.`posts` SET comment_count = comment_count - 1 WHERE id = #{post_id}"
  connect.query(del_cm)
  connect.query(count_comment)
  redirect '/posts'
end
