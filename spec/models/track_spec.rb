require 'rails_helper'

RSpec.describe Track do
  describe "attributes" do
    it "has a name, composer, and millisecond amount" do
      track = build(:track)

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
      track = create(:track)
      expect(track.genre).to be_truthy
    end

    it "is on an album" do
      track = create(:track)
      expect(track.album).to be_truthy
    end

    it "has a media type" do
      track = create(:track)
      expect(track.media_type).to be_truthy
    end

    it "can be on many playlists" do
      track = create(:track, :with_playlists, playlist_count: 3)
      create(:playlist)

      expect(Playlist.count).to eq 4
      expect(track.playlists.count).to eq 3
    end
  end
end
