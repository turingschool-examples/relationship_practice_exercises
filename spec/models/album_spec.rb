require 'rails_helper'

RSpec.describe Album do
  describe "attributes" do
    it "has a title" do
      album = Album.new
      expect(album).to respond_to(:title)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:artist) }
  end

  describe "associations" do
    it "it has many tracks" do
      media_type = MediaType.create(name: "LazerDisk")
      artist     = Artist.create(name: "The Avett Brothers")
      album      = Album.create(title: "Mignonette", artist: artist)
      album2     = Album.create(title: "Emotionalism", artist: artist)
      genre      = Genre.create(name: "R&B")

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

      Track.create(
        name: "Small Father", 
        genre: genre,
        album: album2,
        media_type: media_type,
        milliseconds: 10
      )

      expect(Track.count).to eq 4
      expect(album.tracks.count).to eq 3
    end

    it "belongs to an artist" do
      artist = Artist.create(name: "The Avett Brothers")
      album  = Album.create(title: "I and Love and You", artist: artist)

      expect(album.artist).to eq artist
    end
  end
end
