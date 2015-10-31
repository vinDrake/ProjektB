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

ActiveRecord::Schema.define(version: 20151031184213) do

  create_table "answers", force: :cascade do |t|
    t.boolean  "correct"
    t.integer  "player_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "guess"
  end

  add_index "answers", ["player_id"], name: "index_answers_on_player_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "duels", force: :cascade do |t|
    t.string   "question_set"
    t.boolean  "finish"
    t.integer  "player_one_id"
    t.integer  "player_two_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "duels", ["player_one_id"], name: "index_duels_on_player_one_id"
  add_index "duels", ["player_two_id"], name: "index_duels_on_player_two_id"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "question_feed"
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question_therm"
    t.string   "correct_answer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "wrong_answer"
    t.string   "category"
  end

end
