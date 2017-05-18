require 'rails_helper'

RSpec.describe Playlist do
  describe "attributes" do
    it "has a name" do
      playlist = Playlist.new

      expect(playlist).to respond_to(:name)
    end
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { is_expected.to have_many(:playlist_tracks) }

    it "has many tracks" do
      playlist   = Playlist.create(name: "Jamz")
      album      = Album.create(title: "Ring Away")
      genre      = Genre.create(name: "R&B")
      media_type = MediaType.create(name: "mp3")

      track1 = Track.create(
        name: "Big Poppa", 
        genre: genre,
        album: album,
        media_type: media_type,
        milliseconds: 10
      )
      track2 = Track.create(
        name: "Pig Boppa", 
        genre: genre,
        album: album,
        media_type: media_type,
        milliseconds: 10
      )
      track3 = Track.create(
        name: "Small Father", 
        genre: genre,
        album: album,
        media_type: media_type,
        milliseconds: 10
      )

      playlist.tracks << [track1, track2]

      expect(Track.all).to match_array [track1, track2, track3]
      expect(playlist.tracks).to match_array [track1, track2]
    end
  end
end
