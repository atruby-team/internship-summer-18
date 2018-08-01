class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :user
      t.timestamps
    end
    rename_column :teams, :users_id, :leader_id
    add_reference :users, :teams, foreign_key: true
  end
end

