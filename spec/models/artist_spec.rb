require 'rails_helper'

RSpec.describe Artist do
  describe "attributes" do
    it "has a name" do
      artist = Artist.new
      expect(artist).to respond_to(:name)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it "has many albums" do
      artist  = Artist.create(name: "The Avett Brothers")
      artist2 = Artist.create(name: "The Head and the Heart")
      album1  = Album.create(title: "Mignonette", artist: artist)
      album2  = Album.create(title: "Emotionalism", artist: artist)
      album3  = Album.create(title: "Signs of Light", artist: artist2)

      expect(Album.all).to match_array [album1, album2, album3]
      expect(artist.albums).to match_array [album1, album2]
    end
  end
end
