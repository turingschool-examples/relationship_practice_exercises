class CreatePlaylistTracks < ActiveRecord::Migration
  def change
    create_table :playlist_tracks do |t|
      t.references :track, index: true, foreign_key: true
      t.references :playlist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
