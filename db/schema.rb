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

ActiveRecord::Schema.define(version: 20171208102351) do

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quantity"
    t.float "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "content"
    t.integer "film_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_categories_on_film_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_review_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_review_id"], name: "index_comments_on_post_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.integer "play_time"
    t.string "link_trailer"
    t.string "image"
    t.float "imdb_rate", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "describe"
  end

  create_table "post_reviews", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.boolean "approve", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_post_reviews_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_post_reviews_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "post_review_id"
    t.integer "user_id"
    t.integer "mark", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_review_id", "user_id"], name: "index_ratings_on_post_review_id_and_user_id", unique: true
    t.index ["post_review_id"], name: "index_ratings_on_post_review_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.string "email"
    t.datetime "dob"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.date "birthday"
    t.string "address"
    t.string "remember_digest"
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "oauth_token"
    t.datetime "oauth_exprires_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "watching_times", force: :cascade do |t|
    t.integer "film_id"
    t.integer "booking_id"
    t.datetime "time_begin"
    t.date "day_watching"
    t.integer "total_ticket"
    t.integer "remaining_ticket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_watching_times_on_booking_id"
    t.index ["film_id"], name: "index_watching_times_on_film_id"
  end

end
