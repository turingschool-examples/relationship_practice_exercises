require 'rails_helper'

RSpec.describe Playlist do
  describe "attributes" do
    it "has a name" do
      playlist = build(:playlist)

      expect(playlist).to respond_to(:name)
    end
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { is_expected.to have_many(:playlist_tracks) }

    it "has many tracks" do
      playlist  = create(:playlist, :with_tracks, track_count: 3)
      playlist2 = create(:playlist, :with_tracks, track_count: 1)

      expect(Track.count).to eq 4
      expect(playlist.tracks.count).to eq 3
    end
  end
end
