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


ActiveRecord::Schema.define(version: 2019_03_01_212802) do


  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_bookmarks_on_tour_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "book_seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tour_id"
    t.integer "user_id"
    t.string "choice"
    t.index ["tour_id"], name: "index_books_on_tour_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end


  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tour_id"
    t.integer "user_id"
    t.index ["tour_id"], name: "index_photos_on_tour_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tour_id"
    t.integer "user_id"
    t.text "message"
    t.index ["tour_id"], name: "index_reviews_on_tour_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "total_seat"
    t.integer "aval_seat"
    t.string "status"
    t.decimal "price"
    t.date "booking_deadline"
    t.date "start_date"
    t.date "end_date"
    t.string "start_location"
    t.string "contact_info"
    t.string "country"
    t.string "state"
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "waitlists", force: :cascade do |t|
    t.integer "wait_seat"
    t.integer "user_id"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_waitlists_on_tour_id"
    t.index ["user_id"], name: "index_waitlists_on_user_id"
  end

end
