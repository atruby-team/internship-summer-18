require 'mysql2'

client = Mysql2::Client.new(host: '127.0.0.1', username: 'root', password: 'win112344')

create_database = 'CREATE DATABASE IF NOT EXISTS dungnguyen_sinatra'

client.query(create_database)
client.query('use dungnguyen_sinatra')

create_table_users = "CREATE TABLE IF NOT EXISTS users (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY(`id`));"

create_table_posts = "CREATE TABLE IF NOT EXISTS posts (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `user_id` INT NOT NULL,
  `comment_count` INT NULL,
  PRIMARY KEY(`id`));"

create_table_comments = "CREATE TABLE IF NOT EXISTS comments (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY(`id`));"

client.query(create_table_users)
client.query(create_table_posts)
client.query(create_table_comments)

1.upto(10) do |i|
  client.query("INSERT INTO users(name, address) VALUES('user#{i}','address#{i}')")
end

1.upto(30) do |i|
  user_id = rand(1..10)
  client.query("INSERT INTO posts(content, user_id, comment_count) VALUES('Nội dung bài viết số #{i}', #{user_id}, 0)")
end
