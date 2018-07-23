class RenameColoumToUser < ActiveRecord::Migration[5.2]
  def change
  end
  rename_column :users, :favorite_film, :favorite_song
end
