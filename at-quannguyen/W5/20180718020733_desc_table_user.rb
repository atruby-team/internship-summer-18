class DescTableUser < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, :email
    users = User.all
    users_desc = User.order(id: :desc)
    users.each_with_index do |elemt, index|
      obj = users_desc[index]
      elemt.update_attributes(email: obj.email,
                              password: obj.password,
                              team_id: obj.team_id,
                              single: obj.single,
                              favorite_song: obj.favorite_song,
                              gender: obj.gender)
      team = Team.find_by(user_id: obj.id)
      team.update_attribute(:user_id, elemt.id) unless team.nil?
    end
    add_index :users, :email, unique: true
  end
end
