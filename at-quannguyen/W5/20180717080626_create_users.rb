class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, nil: false
      t.string :password, nil: false
      t.integer :team_id
      t.boolean :single
      t.string :favorite_film
      t.string :gender, nil: false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
