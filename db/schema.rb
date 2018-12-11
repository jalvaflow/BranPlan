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

ActiveRecord::Schema.define(version: 2018_12_11_085313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_requirements", force: :cascade do |t|
    t.string "course_id"
    t.string "requirement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_subjects", force: :cascade do |t|
    t.string "course_code"
    t.string "subject_id"
    t.integer "segment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_id"
    t.string "comment"
    t.string "term"
    t.string "code"
    t.integer "continuity_id"
    t.string "name"
    t.string "description"
    t.float "credits"
    t.boolean "independent_study"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "declarations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.string "degree_type"
    t.integer "electives"
    t.integer "cores"
    t.string "description"
    t.string "site_link"
    t.string "core_courses"
    t.string "elective_courses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "section_id"
    t.integer "term_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "code"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "instructor_id"
    t.string "comment"
    t.string "email"
    t.string "first"
    t.string "middle"
    t.string "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.string "requirement_id"
    t.string "comment"
    t.string "long"
    t.string "short"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_instructors", force: :cascade do |t|
    t.string "section_id"
    t.string "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_times", force: :cascade do |t|
    t.string "section_id"
    t.integer "start"
    t.integer "end"
    t.string "days"
    t.string "section_type"
    t.string "building"
    t.string "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "section_id"
    t.string "comment"
    t.string "course"
    t.integer "section"
    t.string "details"
    t.string "status"
    t.string "status_text"
    t.integer "enrolled"
    t.integer "limit"
    t.integer "waiting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segments", force: :cascade do |t|
    t.integer "segment_id"
    t.string "subject_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_id"
    t.string "comment"
    t.string "term"
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string "term_id"
    t.string "comment"
    t.string "name"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_course_histories", force: :cascade do |t|
    t.integer "user_id"
    t.string "course_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_degrees", force: :cascade do |t|
    t.integer "user_id"
    t.integer "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "credits"
  end

end
