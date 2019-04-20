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

ActiveRecord::Schema.define(version: 20190420144649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.text "description"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_badges_on_skill_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camp_badges", force: :cascade do |t|
    t.bigint "badge_id"
    t.bigint "camp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_camp_badges_on_badge_id"
    t.index ["camp_id"], name: "index_camp_badges_on_camp_id"
  end

  create_table "camp_counselors", force: :cascade do |t|
    t.bigint "camp_id"
    t.bigint "counselor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_camp_counselors_on_camp_id"
    t.index ["counselor_id"], name: "index_camp_counselors_on_counselor_id"
  end

  create_table "camper_camp_badge_tasks", force: :cascade do |t|
    t.bigint "camper_camp_badge_id"
    t.bigint "task_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camper_camp_badge_id"], name: "index_camper_camp_badge_tasks_on_camper_camp_badge_id"
    t.index ["task_id"], name: "index_camper_camp_badge_tasks_on_task_id"
  end

  create_table "camper_camp_badges", force: :cascade do |t|
    t.bigint "camp_badge_id"
    t.bigint "camper_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_badge_id"], name: "index_camper_camp_badges_on_camp_badge_id"
    t.index ["camper_id"], name: "index_camper_camp_badges_on_camper_id"
  end

  create_table "camper_registrations", force: :cascade do |t|
    t.bigint "camp_id"
    t.bigint "camper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_camper_registrations_on_camp_id"
    t.index ["camper_id"], name: "index_camper_registrations_on_camper_id"
  end

  create_table "campers", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "first_name"
    t.string "last_name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_campers_on_parent_id"
  end

  create_table "camps", force: :cascade do |t|
    t.string "name"
    t.string "program"
    t.date "start_date"
    t.date "end_date"
    t.boolean "active"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_camps_on_location_id"
  end

  create_table "counselor_camp_badges", force: :cascade do |t|
    t.bigint "camp_badge_id"
    t.bigint "counselor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_badge_id"], name: "index_counselor_camp_badges_on_camp_badge_id"
    t.index ["counselor_id"], name: "index_counselor_camp_badges_on_counselor_id"
  end

  create_table "counselors", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_counselors_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_locations_on_branch_id"
  end

  create_table "parents", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["badge_id"], name: "index_tasks_on_badge_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "badges", "skills"
  add_foreign_key "camp_badges", "badges"
  add_foreign_key "camp_badges", "camps"
  add_foreign_key "camp_counselors", "camps"
  add_foreign_key "camp_counselors", "counselors"
  add_foreign_key "camper_camp_badge_tasks", "camper_camp_badges"
  add_foreign_key "camper_camp_badge_tasks", "tasks"
  add_foreign_key "camper_camp_badges", "camp_badges"
  add_foreign_key "camper_camp_badges", "campers"
  add_foreign_key "camper_registrations", "campers"
  add_foreign_key "camper_registrations", "camps"
  add_foreign_key "campers", "parents"
  add_foreign_key "camps", "locations"
  add_foreign_key "counselor_camp_badges", "camp_badges"
  add_foreign_key "counselor_camp_badges", "counselors"
  add_foreign_key "counselors", "users"
  add_foreign_key "locations", "branches"
  add_foreign_key "parents", "users"
  add_foreign_key "tasks", "badges"
end
