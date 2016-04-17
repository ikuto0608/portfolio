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

ActiveRecord::Schema.define(version: 20160410214615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiences", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "year"
    t.text     "language"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "about"
    t.string   "based_on"
    t.string   "url"
    t.integer  "degree"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "skills", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "degree"
    t.string   "type"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["type"], name: "index_skills_on_type", using: :btree
  add_index "skills", ["user_id"], name: "index_skills_on_user_id", using: :btree

  create_table "sns", force: true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sns", ["user_id"], name: "index_sns_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "avator_url"
    t.string   "occupation"
    t.string   "live"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
