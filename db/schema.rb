# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170518185635) do

  create_table "albums", force: :cascade do |t|
    t.string  "title"
    t.integer "artist_id"
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id"

  create_table "artists", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "media_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "playlist_tracks", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "track_id"
  end

  add_index "playlist_tracks", ["playlist_id"], name: "index_playlist_tracks_on_playlist_id"
  add_index "playlist_tracks", ["track_id"], name: "index_playlist_tracks_on_track_id"

  create_table "playlists", force: :cascade do |t|
    t.string "name"
  end

  create_table "tracks", force: :cascade do |t|
    t.string  "name"
    t.integer "genre_id"
    t.integer "milliseconds"
    t.string  "composer"
    t.integer "media_type_id"
    t.integer "album_id"
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id"
  add_index "tracks", ["genre_id"], name: "index_tracks_on_genre_id"
  add_index "tracks", ["media_type_id"], name: "index_tracks_on_media_type_id"

end
