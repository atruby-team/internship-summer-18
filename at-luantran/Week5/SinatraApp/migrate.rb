require 'mysql2'

connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                             password: 'hoichuphong513')

create_db = 'CREATE DATABASE IF NOT EXISTS LuanTran_Sinatra'
create_users = 'CREATE TABLE IF NOT EXISTS `LuanTran_Sinatra`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address` TEXT NULL,
  PRIMARY KEY (`id`));'
create_posts = 'CREATE TABLE IF NOT EXISTS `LuanTran_Sinatra`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `user_id` TEXT NULL,
  `comment_count` INT NULL,
  PRIMARY KEY (`id`));'
create_comments = 'CREATE TABLE IF NOT EXISTS `LuanTran_Sinatra`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `post_id` TEXT NULL,
  PRIMARY KEY (`id`));'

connect.query(create_db)
connect.query(create_users)
connect.query(create_posts)
connect.query(create_comments)

create_user = "INSERT INTO `LuanTran_Sinatra`.`users` (`name`,
              `address`) VALUES ('admin', 'Da Nang');"
connect.query(create_user)
1.upto(20) do |x|
  create_post = "INSERT INTO `LuanTran_Sinatra`.`posts` (`content`,
                `user_id`, `comment_count`) VALUES ('Content #{x}', 1, 0);"
  connect.query(create_post)
end

1.upto(20) do |x|
  create_post = "INSERT INTO `LuanTran_Sinatra`.`comments` (`content`,
                `post_id`) VALUES ('Comment #{x}', 1);"
  count_comment = 'UPDATE `LuanTran_Sinatra`.`posts` SET comment_count = comment_count + 1 WHERE id = 1'
  connect.query(create_post)
  connect.query(count_comment)
end
