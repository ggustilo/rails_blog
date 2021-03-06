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

ActiveRecord::Schema.define(version: 20160104021728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string   "title",                                  null: false
    t.text     "content"
    t.integer  "category",                               null: false
    t.text     "requests_for_responses"
    t.text     "additional_resources"
    t.integer  "writer_id",                              null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "published",              default: false
    t.integer  "votes",                  default: 0
    t.boolean  "flagged",                default: false
  end

  create_table "responses", force: :cascade do |t|
    t.string   "title",                      null: false
    t.text     "content"
    t.integer  "writer_id",                  null: false
    t.integer  "post_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "approved",   default: false
    t.integer  "votes",      default: 0
    t.boolean  "flagged",    default: false
  end

  create_table "writers", force: :cascade do |t|
    t.string   "username",                         null: false
    t.string   "email",                            null: false
    t.string   "password_hash",                    null: false
    t.text     "self_description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "flagged",          default: false
  end

end
