class RenameColumnInUsers < ActiveRecord::Migration[5.2]
  def up
    rename_column :users, :favorite_film, :favorite_song
  end

  def down
    rename_column :users, :favorite_song, :favorite_film
  end
end
