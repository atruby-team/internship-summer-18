require 'pry'
require 'mysql2'
class Leave
  attr_reader :id
  attr_accessor :id_user, :reason, :total_date_off, :status, :publish_date
  @@client = Mysql2::Client.new(host: '127.0.0.1', username: 'root', password: 'win112344', database: 'DungNguyen_HumanResources')

  def initialize(id_user, reason, total_date_off, status, publish_date)
    @id_user = id_user
    @reason = reason
    @total_date_off = total_date_off
    @status = status
    @publish_date = publish_date
  end

  def self.add_request(leave)
    sql = "INSERT INTO `DungNguyen_HumanResources`.leave(id_user, reason, total_date_off, status, publish_date) VALUES(#{leave.id_user}, '#{leave.reason}', #{leave.total_date_off}, 0, '#{leave.publish_date}')"
    @@client.query(sql)
    @@client.affected_rows
  end

  def self.update_status(leave_id, status)
    sql = "UPDATE `DungNguyen_HumanResources`.leave SET status = #{status} WHERE id = #{leave_id}"
    @@client.query(sql)
    @@client.affected_rows
  end

  def self.all_approved_request
    sql = 'SELECT * FROM `DungNguyen_HumanResources`.leave WHERE status = 1 ORDER BY id DESC'
    @@client.query(sql).to_a
  end

  def self.all_need_approve
    sql = 'SELECT * FROM `DungNguyen_HumanResources`.leave WHERE status = 0'
    @@client.query(sql).to_a
  end

  def self.update_request(id, leave)
    sql = "UPDATE `DungNguyen_HumanResources`.leave SET reason = '#{leave.reason}', total_date_off = #{leave.total_date_off}, status = 0 WHERE id = #{id}"
    @@client.query(sql)
    @@client.affected_rows
  end

  def self.delete_request(id)
    sql = "DELETE FROM `DungNguyen_HumanResources`.leave WHERE id = #{id}"
    @@client.query(sql)
    @@client.affected_rows
  end

  def self.find_request(id)
    sql = "SELECT * FROM `DungNguyen_HumanResources`.leave WHERE id = #{id}"
    @@client.query(sql).first
  end
end
