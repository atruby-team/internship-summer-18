require 'mysql2'
CREATE TABLE `chuongphu_humanresource`.`employee` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `team` VARCHAR(45) NULL,
  `role` INT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `leave_balance` INT NULL,
  PRIMARY KEY (`id`));

