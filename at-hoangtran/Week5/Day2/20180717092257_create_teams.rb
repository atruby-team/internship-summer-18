class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :users, foreign_key: true, null: false
      t.timestamps
    end
    rename_column :teams, :users_id, :leader_id
  end
end
