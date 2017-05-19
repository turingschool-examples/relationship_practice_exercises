require 'rails_helper'

RSpec.describe Genre do
  describe "attributes" do
    it "has a name" do
      genre = build(:genre, name: "folk")

      expect(genre).to respond_to(:name)
      expect(genre.name). to eq "folk"
    end
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it "has many different tracks" do
      genre  = create(:genre, :with_tracks, track_count: 3)
      genre2 = create(:genre, :with_tracks, track_count: 1)

      expect(Track.count).to eq 4
      expect(genre.tracks.count).to eq 3
    end
  end
end

