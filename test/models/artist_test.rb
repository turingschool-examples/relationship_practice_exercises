require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  def setup
    @artist = Artist.create(name: "DumpTruck")
  end

  test "artist has a name" do
    assert @artist.respond_to?(:name)
    assert_equal "DumpTruck", @artist.name
  end

  test "artist can have many different albums" do
    @artist.albums << [
      Album.create(title: "Fresh Four Winds"),
      Album.create(title: "Rattle Can Gold"),
      Album.create(title: "The Parlour Room")
    ]

    assert_equal 3, @artist.albums.count
    assert_equal "The Parlour Room", @artist.albums.last.title
  end
end
