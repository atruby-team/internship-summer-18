require 'sinatra'
require_relative 'controllers/users_controller'
require_relative 'controllers/posts_controller'
require_relative 'controllers/comments_controller'

get '/posts/' do
  posts = PostsController.new.index params
  erb :'posts/post', locals: { posts: posts[0], current_page: posts[1],
                               total_page: posts[2] }
end

get '/post/:id' do
  post = PostsController.new.show params
  erb :'posts/show', locals: { post: post[0], comments: post[1] }
end

post '/post/' do
  PostsController.new.add params
end

put '/post/' do
  PostsController.new.update params
end

delete '/post/' do
  PostsController.new.delete params
end

post '/comment/' do
  CommentsController.new.add params
end

delete '/comment/' do
  CommentsController.new.delete params
end
