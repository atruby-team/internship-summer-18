class RenameColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :favorite_film, :favorite_song
  end
end
