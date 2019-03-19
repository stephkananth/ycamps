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

ActiveRecord::Schema.define(version: 20190318171158) do

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.text "description"
    t.integer "skill_id"
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
    t.integer "badge_id"
    t.integer "camp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_camp_badges_on_badge_id"
    t.index ["camp_id"], name: "index_camp_badges_on_camp_id"
  end

  create_table "camper_camp_badge_tasks", force: :cascade do |t|
    t.integer "camper_camp_badge_id"
    t.integer "task_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camper_camp_badge_id"], name: "index_camper_camp_badge_tasks_on_camper_camp_badge_id"
    t.index ["task_id"], name: "index_camper_camp_badge_tasks_on_task_id"
  end

  create_table "camper_camp_badges", force: :cascade do |t|
    t.integer "camp_badge_id"
    t.integer "camper_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_badge_id"], name: "index_camper_camp_badges_on_camp_badge_id"
    t.index ["camper_id"], name: "index_camper_camp_badges_on_camper_id"
  end

  create_table "campers", force: :cascade do |t|
    t.integer "parent_id"
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
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_camps_on_location_id"
  end

  create_table "counselor_camp_badges", force: :cascade do |t|
    t.integer "camp_badge_id"
    t.integer "counselor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_badge_id"], name: "index_counselor_camp_badges_on_camp_badge_id"
    t.index ["counselor_id"], name: "index_counselor_camp_badges_on_counselor_id"
  end

  create_table "counselors", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_counselors_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_locations_on_branch_id"
  end

  create_table "parents", force: :cascade do |t|
    t.integer "user_id"
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
    t.integer "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_tasks_on_badge_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
