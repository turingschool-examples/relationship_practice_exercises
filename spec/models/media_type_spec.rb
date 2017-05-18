require 'rails_helper'

RSpec.describe MediaType do
  it "has a name" do
    media = MediaType.new

    expect(media).to respond_to(:name)
  end

  it "a media type can have multiple tracks" do
    media  = MediaType.create(name: "LazerDisk")

    track1 = Track.create(name: "Hello")
    track2 = Track.create(name: "Worldly")

    media.tracks << [track1, track2]

    expect(media.tracks.count).to eq 2
    expect(media.tracks.last.name).to eq "Worldly"
  end
end

