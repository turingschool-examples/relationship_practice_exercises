require 'rails_helper'

RSpec.describe Album do
  it "has a title" do
    album = Album.new
    expect(album).to respond_to(:title)
  end

  it "it has many tracks" do
    album = Album.create(title: "Hot Accross the Tracks")
    album.tracks << [
      Track.create(name: "Hot1"),
      Track.create(name: "Hot2"),
      Track.create(name: "Hot3")
    ]

    expect(album.tracks.count).to eq 3
  end
end
