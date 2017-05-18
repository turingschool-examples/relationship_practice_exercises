require 'rails_helper'

RSpec.describe Track do
  it "has the appropriate attributes" do
    track = Track.new

    expect(track).to respond_to(:name)
    expect(track).to respond_to(:composer)
    expect(track).to respond_to(:milliseconds)
  end

  it "is associated with a genre" do
    genre = Genre.create(name: "R&B")
    track = Track.create(name: "Big Poppa", genre: genre)

    expect(track.genre.name).to eq "R&B"
  end

  it "a track is on an album" do
    album = Album.create(title: "Ring Away")
    track = Track.create(name: "Roundabout", album: album)

    expect(track.album.title).to eq "Ring Away"
  end

  it "a track has a media type" do
    media_type = MediaType.create(name: "mp3")
    track = Track.create(name: "Roundabout", media_type: media_type)

    expect(track.media_type.name).to eq "mp3"
  end
end
