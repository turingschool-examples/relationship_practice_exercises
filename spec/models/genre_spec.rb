require 'rails_helper'

RSpec.describe Genre do
  describe "attributes" do
    it "has a name" do
      genre = Genre.new(name: "folk")

      expect(genre).to respond_to(:name)
      expect(genre.name). to eq "folk"
    end
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it "has many different tracks" do
      media_type = MediaType.create(name: "LazerDisk")
      album      = Album.create(title: "Ring Away")
      genre      = Genre.create(name: "R&B")
      genre2     = Genre.create(name: "Jazz")

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
        name: "Medium Mother", 
        genre: genre2,
        album: album,
        media_type: media_type,
        milliseconds: 10
      )

      expect(Track.count).to eq 4
      expect(genre.tracks.count).to eq 3
      expect(genre.tracks.last.name).to eq "Small Father"
    end
  end
end

