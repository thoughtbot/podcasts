class AddShowsAndEpisodes < ActiveRecord::Migration
  def change
    create_table "shows", force: true do |t|
      t.string   "slug",              null: false
      t.string   "title",             null: false
      t.string   "short_description", null: false
      t.text     "description",       null: false
      t.text     "credits",           null: false
      t.string   "keywords",          null: false
      t.string   "itunes_url",        null: false
      t.string   "stitcher_url"
      t.string   "email",             null: false
      t.datetime "created_at",        null: false
      t.datetime "updated_at",        null: false
    end
  end

  create_table "episodes", force: true do |t|
    t.string   "title"
    t.string   "old_url"
    t.text     "description"
    t.text     "notes"
    t.date     "published_on"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "file_size"
    t.integer  "duration"
    t.integer  "downloads_count",  default: 0, null: false
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.integer  "mp3_file_size"
    t.datetime "mp3_updated_at"
    t.integer  "number"
    t.integer  "show_id"
    t.string   "tags"
  end

  add_index "episodes", ["number"], name: "index_episodes_on_number", using: :btree
  add_index "episodes", ["show_id"], name: "index_episodes_on_show_id", using: :btree
end
