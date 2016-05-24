require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  test "a playlist has a name" do
    playlist = Playlist.create(name: "Best Of")
    assert_equal "Best Of", playlist.name
  end

  test "a playlist is made of multiple tracks and has many playlist tracks" do
    playlist = Playlist.create(name: "NewList")

    playlist.tracks << [
      Track.create(name: "This"),
      Track.create(name: "Is"),
      Track.create(name: "Good")
    ]

    assert_equal 3, playlist.playlist_tracks.count
    assert_equal "Good", playlist.tracks.last.name
  end

end
