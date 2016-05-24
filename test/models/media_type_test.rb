require 'test_helper'

class MediaTypeTest < ActiveSupport::TestCase
  test "a media type has a name" do
    media = MediaType.new

    assert media.respond_to?(:name)
  end

  test "a media type can have multiple tracks" do
    media = MediaType.create(name: "LazerDisk")

    track1 = Track.create(name: "Hello")
    track2 = Track.create(name: "Worldly")

    media.tracks << [track1, track2]

    assert_equal 2, media.tracks.count
    assert_equal "Worldly", media.tracks.last.name
  end
end
