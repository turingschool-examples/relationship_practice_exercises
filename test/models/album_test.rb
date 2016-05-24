require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "an album has a title" do
    album = Album.new
    assert_respond_to album, :title

    album.update_attributes(title: "1999")
  end

  test "an albums is made from many tracks" do
    album = Album.create(title: "Hot Accross the Tracks")
    album.tracks << [
      Track.create(name: "Hot1"),
      Track.create(name: "Hot2"),
      Track.create(name: "Hot3")
    ]

    assert_equal 3, album.tracks.count
  end
end
