# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160704033933) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["product_id"], name: "index_comments_on_product_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "payment_method"
    t.integer  "cost",           default: 0
    t.datetime "paid_at"
    t.boolean  "is_paid",        default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "product_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "number"
    t.integer  "product_id"
    t.integer  "cost_product"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "product_orders", ["order_id"], name: "index_product_orders_on_order_id"
  add_index "product_orders", ["product_id"], name: "index_product_orders_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.string   "picture_link"
    t.float    "price"
    t.integer  "classify"
    t.integer  "quantity"
    t.float    "rating"
    t.integer  "category_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "rating_score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ratings", ["product_id"], name: "index_ratings_on_product_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "suggests", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "suggests", ["user_id"], name: "index_suggests_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.string   "avatar_link"
    t.boolean  "is_admin",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
