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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120330205739) do

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.string   "business"
    t.string   "job_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time_scrapped"
    t.date     "date_posted"
    t.datetime "date_scrapped"
    t.integer  "scrapper_id"
    t.integer  "likes"
  end

  create_table "line_items", :id => false, :force => true do |t|
    t.integer  "job_id"
    t.integer  "scrapper_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scrappers", :force => true do |t|
    t.string   "title"
    t.string   "source"
    t.string   "task"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

end
