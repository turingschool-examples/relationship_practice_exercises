require 'rails_helper'

RSpec.describe Artist do
  describe "attributes" do
    it "has a name" do
      artist = build(:artist)
      expect(artist).to respond_to(:name)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it "has many albums" do
      artist  = create(:artist, :with_albums, album_count: 2)
      artist2 = create(:artist, :with_albums, album_count: 1)

      expect(Album.count).to eq 3
      expect(artist.albums.count).to eq 2
    end
  end
end
