class Track < ActiveRecord::Base
  belongs_to :genre
  belongs_to :album
  belongs_to :media_type
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :playlist_tracks
  has_many :playlists, through: :playlist_tracks
end
