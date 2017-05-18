class Track < ActiveRecord::Base
  belongs_to :album
  belongs_to :genre
  belongs_to :media_type
  has_many   :playlist_tracks
  has_many   :playlists, through: :playlist_tracks

  validates_presence_of :name, :media_type, :milliseconds
end
