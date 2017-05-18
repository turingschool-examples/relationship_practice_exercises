class AddArtistIdToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :artist, index: true, foreign_key: true
  end
end
