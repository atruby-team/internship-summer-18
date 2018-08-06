require 'mysql2'
require_relative '../Migrate/connect_db'
class Migrate
  attr_accessor :client
  def initialize; end

  def self.create_database
    $client.query('CREATE DATABASE TranHoang_HumanResources;')
  end

  def self.create_table
    $client.query("CREATE TABLE TranHoang_HumanResources.Team (
      team_id INT NOT NULL AUTO_INCREMENT,
      name VARCHAR(255) NULL,
      total_member INT NULL,
      PRIMARY KEY (team_id));")

    $client.query("CREATE TABLE TranHoang_HumanResources.Role (
      role_id INT NOT NULL AUTO_INCREMENT,
      name VARCHAR(255) NULL,
      PRIMARY KEY (role_id));")

    $client.query("CREATE TABLE TranHoang_HumanResources.Employee (
      employee_id INT NOT NULL AUTO_INCREMENT,
      name VARCHAR(255) NULL,
      team_id INT NOT NULL,
      role_id INT NULL,
      user_name VARCHAR(255) NULL,
      password VARCHAR(255) NULL,
      leave_balance VARCHAR(255) NULL,
      PRIMARY KEY (employee_id),
      FOREIGN KEY (role_id) REFERENCES Role(role_id),
      FOREIGN KEY (team_id) REFERENCES Team(team_id));")

    $client.query("CREATE TABLE TranHoang_HumanResources.Notification (
      notification_id INT NOT NULL AUTO_INCREMENT,
      title VARCHAR(255) NULL,
      content TEXT NULL,
      publish_date DATE NULL,
      PRIMARY KEY (notification_id));")

    $client.query("CREATE TABLE TranHoang_HumanResources.Leave (
      leave_id INT NOT NULL AUTO_INCREMENT,
      employee_id INT NOT NULL,
      reason TEXT NULL,
      total_date_off INT NULL,
      status INT NULL,
      publish_date DATE NULL,
      PRIMARY KEY (leave_id),
      FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));")
    $client.query("CREATE TABLE TranHoang_HumanResources.TeamLeader (
      team_lead_id INT NOT NULL AUTO_INCREMENT,
      team_id INT,
      employee_id INT,
      PRIMARY KEY (team_lead_id));")
  end
end
ConnectMigrate.connect
Migrate.create_database
Migrate.create_table
