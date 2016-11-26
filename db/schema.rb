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

ActiveRecord::Schema.define(version: 20161121211613) do

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "message"
    t.string   "link"
    t.boolean  "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "qid"
    t.decimal  "reward"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ans1"
    t.string   "ans2"
    t.string   "ans3"
    t.string   "ans4"
    t.string   "answer"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "symbol"
    t.string   "name"
    t.decimal  "current_price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "amount_change"
    t.float    "year_high"
    t.float    "year_low"
    t.string   "percent_change"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stock_id"
    t.decimal  "current_stock_val"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.boolean  "buy_sell"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "user_owned_stocks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stock_id"
    t.integer  "quantity_owned"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_stocks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.decimal  "currency"
    t.text     "description"
    t.boolean  "admin"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.datetime "last_login"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.decimal  "percent_increase"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
