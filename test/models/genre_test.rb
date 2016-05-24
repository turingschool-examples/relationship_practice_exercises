require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  test "a genre can call a name" do
    genre = Genre.new
    genre.name = "Folk"
    genre.save

    assert genre.respond_to? :name
    assert_equal "Folk", genre.name
  end

  test "a genre can have many different tasks" do
    genre = Genre.create(name: "AcidJazz")
    genre.tracks << [
      Track.create(name: "Idigo"),
      Track.create(name: "In the Attick"),
      Track.create(name: "Inside Out")
    ]

    assert_equal 3, genre.tracks.count
    assert_equal "Inside Out", genre.tracks.last.name
  end
end
