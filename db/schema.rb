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

ActiveRecord::Schema.define(version: 2019_11_12_145354) do

  create_table "location_monsters", force: :cascade do |t|
    t.integer "location_id"
    t.integer "monster_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "world_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.float "challenge_rating"
    t.string "monster_type"
    t.string "sub_type"
    t.string "alignment"
  end

  create_table "stories", force: :cascade do |t|
    t.string "story_name"
    t.integer "user_id"
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worlds", force: :cascade do |t|
    t.string "name"
    t.integer "story_id"
  end

end
