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

ActiveRecord::Schema.define(version: 2019_04_25_135319) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "street"
    t.string "zip"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
  end

  create_table "claims", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pantry_item_id"
    t.integer "quantity"
    t.boolean "aproved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "neighbors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pantry_request_id"
    t.integer "quantity"
    t.boolean "accepted", default: false
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pantry_items", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.decimal "price"
    t.integer "quantity"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pantry_requests", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "quantity"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "email"
  end

end
