class AddAlbumIdToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :album, index: true, foreign_key: true
  end
end
