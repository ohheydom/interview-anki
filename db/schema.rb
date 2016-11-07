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

ActiveRecord::Schema.define(version: 20161106223629) do

  create_table "challenges", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "description"
    t.string   "boilerplate_code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "creator_id"
    t.string   "starter_code"
    t.integer  "language"
    t.string   "test_case_input"
    t.string   "test_case_output"
    t.index ["creator_id"], name: "index_challenges_on_creator_id"
  end

  create_table "user_challenges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "interval"
    t.integer  "reviews"
    t.datetime "last_reviewed"
    t.datetime "due_date"
    t.index ["challenge_id"], name: "index_user_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_user_challenges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
