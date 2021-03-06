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

ActiveRecord::Schema.define(version: 20130903001426) do

  create_table "album_artist_relationships", force: true do |t|
    t.integer  "album_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_artist_relationships", ["album_id", "artist_id"], name: "index_album_artist_relationships_on_album_id_and_artist_id"
  add_index "album_artist_relationships", ["album_id"], name: "index_album_artist_relationships_on_album_id"
  add_index "album_artist_relationships", ["artist_id"], name: "index_album_artist_relationships_on_artist_id"

  create_table "album_song_relationships", force: true do |t|
    t.integer  "album_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_song_relationships", ["album_id", "song_id"], name: "index_album_song_relationships_on_album_id_and_song_id", unique: true
  add_index "album_song_relationships", ["album_id"], name: "index_album_song_relationships_on_album_id"
  add_index "album_song_relationships", ["song_id"], name: "index_album_song_relationships_on_song_id"

  create_table "albums", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.string   "extlink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogposts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",    default: false
    t.datetime "published_at"
    t.string   "title"
  end

  add_index "blogposts", ["created_at"], name: "index_blogposts_on_created_at"

  create_table "song_artist_relationships", force: true do |t|
    t.integer  "song_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "song_artist_relationships", ["artist_id"], name: "index_song_artist_relationships_on_artist_id"
  add_index "song_artist_relationships", ["song_id", "artist_id"], name: "index_song_artist_relationships_on_song_id_and_artist_id", unique: true
  add_index "song_artist_relationships", ["song_id"], name: "index_song_artist_relationships_on_song_id"

  create_table "songs", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
