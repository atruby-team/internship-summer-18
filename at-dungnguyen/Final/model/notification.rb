class Notification
  attr_reader :id
  attr_accessor :title, :content, :publish_date, :id_team
  @@client = Mysql2::Client.new(host: '127.0.0.1', username: 'root', password: 'win112344', database: 'DungNguyen_HumanResources')

  def initialize(title, content, publish_date, id_team)
    @title = title
    @content = content
    @publish_date = publish_date
    @id_team = id_team
  end

  def self.add_notify(notify)
    sql = "INSERT INTO notification(title, content, publish_date, id_team)
      VALUES('#{notify.title}', '#{notify.content}', '#{notify.publish_date}', '#{notify.id_team}')"
    @@client.query(sql)
    @@client.affected_rows
  end

  def self.get_notify(id)
    sql = "SELECT * FROM notification WHERE id = #{id}"
    @@client.query(sql).first
  end

  def self.del_notify(id)
    sql = "DELETE FROM notification WHERE id = #{id}"
    @@client.query(sql)
    @@client.affected_rows
  end

  def self.get_all_notify(id_team)
    sql = "SELECT * FROM notification WHERE id_team = #{id_team}"
    @@client.query(sql).to_a
  end
end
