class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.integer :team_id
      t.boolean :single
      t.string :favorite_film
      t.string :gender
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
