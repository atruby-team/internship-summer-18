require 'mysql2'

client = Mysql2::Client.new(host: 'localhost', username: 'root', password: 'huyhoang1')

create_database = 'CREATE DATABASE IF NOT EXISTS Post;'

create_user = "CREATE TABLE IF NOT EXISTS `Post`.`users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `address` varchar(255),
  PRIMARY KEY (`user_id`)
);"

create_post = "CREATE TABLE IF NOT EXISTS `Post`.`posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(11),
  `comment_count` int(11),
  PRIMARY KEY (`post_id`),
  KEY `FK_PostUser` (`user_id`),
  CONSTRAINT `FK_PostUser` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);"

create_comment = "CREATE TABLE IF NOT EXISTS `Post`.`comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11),
  `content` text,
  PRIMARY KEY (`comment_id`),
  KEY `FK_CommentPost` (`post_id`),
  CONSTRAINT `FK_CommentPost` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
);"

client.query(create_database)
client.query(create_user)
client.query(create_post)
client.query(create_comment)

1.upto(10) do |x|
  client.query("INSERT INTO `Post`.`users` (name, address) VALUES ('User #{x}', 'Address #{x}')")
end
1.upto(30) do |x|
  user_id = rand(1..10)
  client.query("INSERT INTO `Post`.`posts` (content, user_id, comment_count) VALUES ('Content #{x}', #{user_id}, 0)")
end

1.upto(30) do |x|
  post_id = rand(1..30)
  client.query("INSERT INTO `Post`.`comments` (post_id, content) VALUES ('#{post_id}', 'This is Comment #{x}')")
end
