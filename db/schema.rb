ActiveRecord::Schema[7.0].define(version: 2023_03_28_212350) do
  create_table "awards", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_event_awards", force: :cascade do |t|
    t.string "description"
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.integer "award_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_id"], name: "index_user_event_awards_on_award_id"
    t.index ["event_id"], name: "index_user_event_awards_on_event_id"
    t.index ["user_id"], name: "index_user_event_awards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_event_awards", "awards"
  add_foreign_key "user_event_awards", "events"
  add_foreign_key "user_event_awards", "users"
end
