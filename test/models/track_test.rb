require 'test_helper'

class TrackTest < ActiveSupport::TestCase

  test "a track has the appropriate attributes" do
    track = Track.new

    assert track.respond_to?(:name)
    assert track.respond_to?(:composer)
    assert track.respond_to?(:milliseconds)
  end

  test "a track is associated with a genre" do
    genre = Genre.create(name: "R&B")
    track = Track.create(name: "Big Poppa", genre: genre)

    assert_equal "R&B", track.genre.name
  end

  test "a track is on an album" do
    album = Album.create(title: "Ring Away")
    track = Track.create(name: "Roundabout", album: album)

    assert_equal "Ring Away", track.album.title
  end

  test "a track has a media type" do
    media_type = MediaType.create(name: "mp3")
    track = Track.create(name: "Roundabout", media_type: media_type)

    assert_equal "mp3", track.media_type.name
  end

  test "a track is shown for many different invoice items" do
    track = Track.create(name: "Hot Track")

    track.invoice_items.create
    track.invoice_items.create

    assert_equal 2, track.invoice_items.count
  end

  test "a track is associated on many different invoices as many different invoice items" do
    track = Track.create(name: "Hot Track")

    track.invoices.create
    track.invoices.create

    assert_equal 2, track.invoice_items.count
  end

  test "a track shown on multiple playlists as a playlist track" do
    track = Track.create(name: "GoodStuff")

    track.playlists << [ Playlist.create(name: "Playlist1"),
                         Playlist.create(name: "Playlist2")
                       ]

    assert_equal 2, track.playlist_tracks.count
    assert_equal 2, track.playlists.count
  end
end
