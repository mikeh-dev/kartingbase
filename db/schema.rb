# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_07_115526) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chassis", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "year"
    t.boolean "stolen", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.integer "user_id"
    t.index ["user_id"], name: "index_chassis_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer "track_id", null: false
    t.integer "chassis_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "fuelload", precision: 3, scale: 1
    t.decimal "endfuel", precision: 3, scale: 1
    t.datetime "date"
    t.integer "run"
    t.string "gearing"
    t.decimal "prepressure", precision: 3, scale: 1
    t.decimal "postpressure", precision: 3, scale: 1
    t.integer "rearwidth"
    t.string "frontwidth"
    t.integer "needleclip"
    t.integer "jet"
    t.float "bestlap"
    t.float "secondbestlap"
    t.float "thirdbestlap"
    t.time "time"
    t.float "airmix"
    t.float "idle"
    t.string "rimset"
    t.string "tyre"
    t.string "tyreset"
    t.string "camber"
    t.string "caster"
    t.string "toe"
    t.string "frontride"
    t.string "rearride"
    t.string "plug"
    t.string "frontbar"
    t.string "fuelmix"
    t.string "condition"
    t.integer "chain"
    t.string "axle"
    t.float "endweight"
    t.integer "lapcount"
    t.decimal "enginehour", precision: 4, scale: 2
    t.integer "tyreage"
    t.decimal "waddingage", precision: 4, scale: 2
    t.decimal "gearoilage", precision: 4, scale: 2
    t.string "sessiontype"
    t.string "mainchanges"
    t.text "sessionnotes"
    t.integer "besttoprevs"
    t.integer "bestbottomrevs"
    t.integer "secondbestlaptoprevs"
    t.integer "secondbestlapbottomrevs"
    t.integer "thirdbesttoprevs"
    t.integer "thirdbestbottomrevs"
    t.integer "highestrevs"
    t.string "engine"
    t.index ["chassis_id"], name: "index_entries_on_chassis_id"
    t.index ["track_id"], name: "index_entries_on_track_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.integer "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "entry_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["entry_id"], name: "index_tracks_on_entry_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chassis", "users"
  add_foreign_key "entries", "chassis"
  add_foreign_key "entries", "tracks"
  add_foreign_key "entries", "users"
  add_foreign_key "microposts", "users"
  add_foreign_key "tracks", "entries"
end
