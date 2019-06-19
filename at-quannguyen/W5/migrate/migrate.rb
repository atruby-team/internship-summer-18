require_relative '../config/db.rb'

class Migrate
  def initialize
    @db = Db.new
    @query = @db.connect
  end

  def create
    @query.query("DROP DATABASE IF EXISTS #{@db.database}")
    @query.query("CREATE DATABASE #{@db.database}")
  end

  def drop
    @query.query("DROP DATABASE IF EXISTS #{@db.database}")
  end

  def create_table_users
    sql = '
      CREATE TABLE users (
        id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name NVARCHAR(150),
        address NVARCHAR(150)
      )
    '
    @query.query(sql)
  end

  def create_table_posts
    sql = '
      CREATE TABLE posts (
        id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        content NVARCHAR(150),
        user_id INT(11),
        comment_count INT(11)
      )
    '
    @query.query(sql)
  end

  def create_table_comments
    sql = '
      CREATE TABLE comments (
        id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        content NVARCHAR(150),
        post_id INT(11)
      )
    '
    @query.query(sql)
  end

  def create_users
    10.times do |n|
      sql = '
        INSERT INTO users (name, address) VALUES (?, ?)
      '
      statement = @query.prepare(sql)
      statement.execute("user-#{n + 1}", "DaNang-NgoQuyen-K-#{n + 1}")
    end
  end

  def create_table
    @db.select_db
    create_table_users
    create_table_posts
    create_table_comments
    create_users
  end

  def run_all
    create
    create_table
    @query.close
  end
end

Migrate.new.run_all
