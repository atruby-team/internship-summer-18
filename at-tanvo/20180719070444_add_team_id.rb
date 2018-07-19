class AddTeamId < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :teams, foreign_key: true
  end
end
