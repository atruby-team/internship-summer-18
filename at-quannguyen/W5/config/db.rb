require 'mysql2'
class Db
  attr_accessor :host, :username, :password, :database

  def initialize
    self.host = 'localhost'
    self.username = 'root'
    self.password = 'root'
    self.database = 'quannguyen_sinatra'
  end

  def connect
    @client = Mysql2::Client.new(host: @host, username: @username,
                                 password: @password)
  end

  def select_db
    @client.query("use #{@database}")
  end
end
