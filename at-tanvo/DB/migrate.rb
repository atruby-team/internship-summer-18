require 'mysql2'
client = Mysql2::Client.new(host: 'localhost', username: 'root', password: '123456')
client.query('CREATE DATABASE IF NOT EXISTS TanVo_HumanResources;')
client.query("CREATE TABLE IF NOT EXISTS `TanVo_HumanResources`.`team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `team_lead` INT NULL,
  `total_member` INT NULL,
  PRIMARY KEY (`id`));")
client.query("CREATE TABLE IF NOT EXISTS `TanVo_HumanResources`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `team` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `leave_balance` INT NULL,
  PRIMARY KEY (`id`));")
client.query("CREATE TABLE IF NOT EXISTS `TanVo_HumanResources`.`notification` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(45) NULL,
    `content` LONGTEXT NULL,
    `publish_date` DATETIME NULL,
    PRIMARY KEY (`id`));")
client.query("CREATE TABLE IF NOT EXISTS `TanVo_HumanResources`.`leave` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user` VARCHAR(45) NULL,
    `reason` LONGTEXT NULL,
    `total_date_off` INT NULL,
    `status` VARCHAR(45) NULL,
    `publish_date` DATETIME NULL,
    PRIMARY KEY (`id`));")
client.select_db('TanVo_HumanResources')
