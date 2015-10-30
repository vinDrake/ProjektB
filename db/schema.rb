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

ActiveRecord::Schema.define(version: 20151029112112) do

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches_players", force: :cascade do |t|
    t.integer "match_id"
    t.integer "player_id"
  end

  add_index "matches_players", ["match_id"], name: "index_matches_players_on_match_id"
  add_index "matches_players", ["player_id"], name: "index_matches_players_on_player_id"

  create_table "matches_questions", force: :cascade do |t|
    t.integer "match_id"
    t.integer "question_id"
  end

  add_index "matches_questions", ["match_id"], name: "index_matches_questions_on_match_id"
  add_index "matches_questions", ["question_id"], name: "index_matches_questions_on_question_id"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question_therm"
    t.string   "correct_answer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
