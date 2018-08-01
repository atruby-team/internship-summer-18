class Database
  attr_accessor :host, :username, :password, :database

  def connect
    @client = Mysql2::Client.new(host: 'localhost', username: 'root',
      password: '123456789')
  end

  def use_db
    @client.query("#{@database}")
  end
end