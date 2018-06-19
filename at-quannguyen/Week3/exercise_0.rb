require 'mysql2'

class Mysql2Connect
  attr_accessor :host, :username, :password, :database

  def initialize host, username, password, database
    self.host = host
    self.username = username
    self.password = password
    self.database = database
  end

  def connection
    Mysql2::Client.new(:host => @host, :username => @username, :password => @password, :database => @database)
  end
end

class Football
  attr_accessor :footballs, :client, :length

  def initialize footballs, client
    self.footballs = footballs
    self.client = client
    self.length = footballs.length - 1
  end

  def insertFor
    for i in 0..@length
      query i
    end
  end

  def insertUntil
    counter = 0
    until counter > @length do
      query counter
      counter += 1
    end
  end

  def insertWhile
    counter = 0
    while counter <= @length
      query counter
      counter +=1
    end
  end

  def print
    query = client.query("SELECT * FROM football_names")
    query.each do |obj|
      puts "Id : #{obj["id"]}, Name : #{obj["name"]}"
    end
  end

  def query i
    statement = client.prepare("INSERT INTO football_names (name) VALUES (?)")
    statement.execute(footballs[i])
  end
end

footballs = ["Ronadol", "Reonatdo", "Batman", "Hup"]
connect   = Mysql2Connect.new("localhost", "root", "root", "football")
football  = Football.new(footballs, connect.connection())

football.insertWhile()
football.print()
