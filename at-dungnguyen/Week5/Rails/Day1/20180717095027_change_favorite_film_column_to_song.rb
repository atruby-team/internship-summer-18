class ChangeFavoriteFilmColumnToSong < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :favorite_film, :favorite_song
  end
end
