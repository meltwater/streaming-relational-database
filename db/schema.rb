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

ActiveRecord::Schema.define(version: 20170503080027) do

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "sentiment"
    t.datetime "publish_date"
    t.string   "language_code"
    t.string   "image_link"
    t.string   "city"
    t.string   "region"
    t.string   "author"
    t.string   "hit_sentence"
    t.string   "meltwater_uuid"
    t.string   "url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "search_name"
    t.integer  "search_id"
    t.string   "hook_id"
  end

  create_table "key_phrases", force: :cascade do |t|
    t.integer  "document_id"
    t.float    "relevance"
    t.string   "phrase"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_key_phrases_on_document_id"
  end

  create_table "matched_keywords", force: :cascade do |t|
    t.integer  "document_id"
    t.string   "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_matched_keywords_on_document_id"
  end

  add_foreign_key "key_phrases", "documents", on_delete: :cascade
  add_foreign_key "matched_keywords", "documents", on_delete: :cascade
end
