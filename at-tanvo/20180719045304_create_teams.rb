class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.bigint :leader_id

      t.timestamps
    end
    add_foreign_key :teams, :users, column: :leader_id
  end
end
