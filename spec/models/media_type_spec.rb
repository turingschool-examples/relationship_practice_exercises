require 'rails_helper'

RSpec.describe MediaType do
  describe "attributes" do
    it "has a name" do
      media = build(:media_type)

      expect(media).to respond_to(:name)
    end
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it "a media type can have multiple tracks" do
      media_type  = create(:media_type, :with_tracks, track_count: 3)
      media_type2 = create(:media_type, :with_tracks, track_count: 1)

      expect(Track.count).to eq 4
      expect(media_type.tracks.count).to eq 3
    end
  end
end

