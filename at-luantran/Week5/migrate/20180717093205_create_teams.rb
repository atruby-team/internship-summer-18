class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.references :users, foreign_key: true

      t.timestamps
    end
    rename_column :teams, :users_id, :leader_id
  end
end
