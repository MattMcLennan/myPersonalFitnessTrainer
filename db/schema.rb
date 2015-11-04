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

ActiveRecord::Schema.define(version: 20151104190724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meals", force: true do |t|
    t.string   "food_name"
    t.integer  "calories"
    t.integer  "protien"
    t.integer  "fat"
    t.integer  "carbs"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meals", ["user_id"], name: "index_meals_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "goal"
    t.string   "fitBit_ID"
    t.string   "fitBit_auth"
    t.string   "fatSecret_ID"
    t.string   "fatSecret_auth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
