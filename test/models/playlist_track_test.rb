require 'test_helper'

class PlaylistTrackTest < ActiveSupport::TestCase
  test "playlist track knows about playlist and track" do
    playlist_track = PlaylistTrack.new

    assert playlist_track.respond_to?(:playlist)
    assert playlist_track.respond_to?(:track)
  end

  test "a playlist track can return the name of its track and playlist" do
    playlist = Playlist.create(name: "Tunes")
    track = Track.create(name: "Jammin")

    playlist_track = PlaylistTrack.create(playlist: playlist, track: track)

    assert 1, PlaylistTrack.count
    assert "Tunes", playlist_track.playlist.name
    assert "Jammin", playlist_track.track.name
  end
end
