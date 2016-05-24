require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "an album has a title" do
    album = Album.new
    assert_respond_to album, :title

    album.update_attributes(title: "1999")
  end

  test "an album can call artist" do
    album = Album.new
    assert_respond_to album, :artist
  end

  test "an album can assign and recall an artist" do
    artist = Artist.create(name: "Prince")
    album  = artist.albums.create(title: "1999")

    assert_respond_to album, :artist
    assert_equal "Prince", album.artist.name
    assert_equal "1999", album.title
  end
end
