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

ActiveRecord::Schema.define(version: 20160524040214) do

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "address"
    t.string   "city"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.integer  "employee_id"
    t.integer  "postal_code_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "customers", ["postal_code_id"], name: "index_customers_on_postal_code_id"

  create_table "employees", force: :cascade do |t|
    t.string   "email"
    t.string   "fax"
    t.string   "phone"
    t.integer  "postal_code_id"
    t.string   "address"
    t.string   "hire_date"
    t.string   "birth_date"
    t.string   "title"
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "reports_to"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "invoice_items", force: :cascade do |t|
    t.string   "unit_price"
    t.string   "quanitty"
    t.integer  "invoice_id"
    t.integer  "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invoice_items", ["invoice_id"], name: "index_invoice_items_on_invoice_id"
  add_index "invoice_items", ["track_id"], name: "index_invoice_items_on_track_id"

  create_table "invoices", force: :cascade do |t|
    t.string   "date"
    t.string   "total"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id"

  create_table "media_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postal_codes", force: :cascade do |t|
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "name"
    t.string   "composer"
    t.integer  "milliseconds"
    t.decimal  "unit_price"
    t.integer  "bytes"
    t.integer  "genre_id"
    t.integer  "album_id"
    t.integer  "media_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id"
  add_index "tracks", ["genre_id"], name: "index_tracks_on_genre_id"
  add_index "tracks", ["media_type_id"], name: "index_tracks_on_media_type_id"

end
