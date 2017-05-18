require 'rails_helper'

RSpec.describe Track do
  describe "attributes" do
    it "has a name, composer, and millisecond amount" do
      track = Track.new

      expect(track).to respond_to(:name)
      expect(track).to respond_to(:composer)
      expect(track).to respond_to(:milliseconds)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:media_type) }
    it { is_expected.to validate_presence_of(:milliseconds) }
  end

  describe "associations" do
    it { is_expected.to have_many(:playlist_tracks) }
    it { is_expected.to have_many(:playlists).through(:playlist_tracks) }

    it "is associated with a genre" do
      genre = Genre.create(name: "R&B")
      track = Track.new(genre: genre)

      expect(track.genre.name).to eq "R&B"
    end

    it "is on an album" do
      album = Album.create(title: "Ring Away")
      track = Track.new(album: album)

      expect(track.album.title).to eq "Ring Away"
    end

    it "has a media type" do
      media_type = MediaType.create(name: "mp3")
      track = Track.new(media_type: media_type)

      expect(track.media_type.name).to eq "mp3"
    end

    it "can be on many playlists" do
      album = Album.create(title: "Ring Away")
      genre = Genre.create(name: "R&B")
      media_type = MediaType.create(name: "mp3")
      track = Track.create(
        name: "Big Poppa", 
        genre: genre,
        album: album,
        media_type: media_type,
        milliseconds: 10
      )
      playlist1 = Playlist.create(name: "Roundies")
      playlist2 = Playlist.create(name: "Bouties")

      playlist1.tracks << track
      playlist2.tracks << track

      expect(track.playlists).to match_array [playlist1, playlist2]
    end
  end

end
