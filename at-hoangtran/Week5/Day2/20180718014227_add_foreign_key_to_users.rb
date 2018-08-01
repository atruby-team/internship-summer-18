class AddForeignKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :teams, foreign_key: true
  end
end
