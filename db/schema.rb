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

ActiveRecord::Schema.define(version: 20151116201954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: true do |t|
    t.integer  "user_id"
    t.integer  "bench",               default: 0
    t.integer  "deadlift",            default: 0
    t.integer  "squat",               default: 0
    t.integer  "overhead_press",      default: 0
    t.integer  "barbell_row",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bench_reps",          default: 0
    t.integer  "deadlift_reps",       default: 0
    t.integer  "squat_reps",          default: 0
    t.integer  "overhead_press_reps", default: 0
    t.integer  "barbell_row_reps",    default: 0
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id", using: :btree

  create_table "meals", force: true do |t|
    t.string   "food"
    t.integer  "calories"
    t.integer  "protein"
    t.integer  "carbs"
    t.integer  "fat"
    t.integer  "per_grams"
    t.string   "diet_name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "template_chosen", default: false
    t.string   "token"
    t.string   "secret"
    t.integer  "avg_weekly_cals"
    t.text     "daily_meal"
    t.string   "gender"
    t.integer  "weight"
  end

end
