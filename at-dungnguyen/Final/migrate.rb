require 'mysql2'
require 'bcrypt'

@db_host  = '127.0.0.1'
@db_user  = 'root'
@db_pass  = 'win112344'

client = Mysql2::Client.new(host: @db_host, username: @db_user, password: @db_pass)

create_database = 'CREATE DATABASE IF NOT EXISTS DungNguyen_HumanResources'

create_table_employee = "CREATE TABLE IF NOT EXISTS `DungNguyen_HumanResources`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `team` INT NULL,
  `role` INT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `leave_balance` INT NULL,
  PRIMARY KEY (`id`));
"

create_table_team = "CREATE TABLE IF NOT EXISTS `DungNguyen_HumanResources`.`team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `team_lead` INT NOT NULL,
  `total_members` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT fkey_team FOREIGN KEY(team_lead) REFERENCES `DungNguyen_HumanResources`.`employee`(id));
"

create_table_notification = "CREATE TABLE IF NOT EXISTS `DungNguyen_HumanResources`.`notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `content` TEXT NULL,
  `publish_date` DATETIME NULL,
  `id_team` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT fkey_notify FOREIGN KEY(id_team) REFERENCES `DungNguyen_HumanResources`.`team`(id));
"
create_table_leave = "CREATE TABLE IF NOT EXISTS `DungNguyen_HumanResources`.`leave` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `reason` TEXT NULL,
  `total_date_off` INT NULL,
  `status` INT NULL,
  `publish_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT fkey_leave FOREIGN KEY(id_user) REFERENCES `DungNguyen_HumanResources`.`employee`(id));
"
pass = BCrypt::Password.create('admin')

admin_account = "INSERT INTO `DungNguyen_HumanResources`.`employee`(name, role, username, password, leave_balance) VALUES('Admin', 2, 'admin', '#{pass}', 0)"

client.query(create_database)
client.query(create_table_employee)
client.query(create_table_team)
client.query(create_table_notification)
client.query(create_table_leave)
client.query(admin_account)
