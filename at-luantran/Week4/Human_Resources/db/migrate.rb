require 'mysql2'

connect = Mysql2::Client.new(host: 'localhost', username: 'root',
                             password: 'hoichuphong513')

create_db = 'CREATE DATABASE IF NOT EXISTS LuanTranHumanResources'
create_team = 'CREATE TABLE IF NOT EXISTS `LuanTranHumanResources`.`team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `team_lead` INT NULL,
  `total_members` INT NULL,
  PRIMARY KEY (`id`));'
create_employee = 'CREATE TABLE IF NOT EXISTS `LuanTranHumanResources`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `id_team` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` TEXT NULL,
  `leave_balance` INT NULL,
  PRIMARY KEY (`id`));'
create_nontification = 'CREATE TABLE IF NOT EXISTS `LuanTranHumanResources`.`notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `content` MEDIUMTEXT NULL,
  `pulbish_date` DATE NULL,
  `id_team` INT NULL,
  PRIMARY KEY (`id`));'
create_leave = 'CREATE TABLE IF NOT EXISTS `LuanTranHumanResources`.`leave` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NULL,
  `reason` TEXT NULL,
  `total_day_off` INT NULL,
  `status` VARCHAR(45) NULL,
  `publish_date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));'

connect.query(create_db)
connect.select_db('LuanTranHumanResources')
connect.query(create_team)
connect.query(create_employee)
connect.query(create_leave)
connect.query(create_nontification)
