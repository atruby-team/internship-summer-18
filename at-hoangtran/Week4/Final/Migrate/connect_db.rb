require 'mysql2'
class ConnectMigrate
  attr_accessor :client
  def initialize; end

  def self.connect
    $client = Mysql2::Client.new(host: 'localhost', username: 'root', password: 'huyhoang1')
  end
end
ConnectMigrate.connect
