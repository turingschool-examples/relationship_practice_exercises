class AddMediaTypeIdToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :media_type, index: true, foreign_key: true
  end
end
