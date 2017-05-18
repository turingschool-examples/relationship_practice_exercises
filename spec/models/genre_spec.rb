require 'rails_helper'

RSpe.describe Genre do
  it "has a name" do
    genre = Genre.new(name: "Folk")

    expect(genre).to respond_to(:name)
    expect(genre.name). to eq "Folk"
  end

  it "has many different tracks" do
    genre = Genre.create(name: "AcidJazz")
    genre.tracks << [
      Track.create(name: "Idigo"),
      Track.create(name: "In the Attick"),
      Track.create(name: "Inside Out")
    ]

    expect(genre.tracks.count).to eq 3
    expect(genre.tracks.last.name).to eq "Inside Out"
  end
end

