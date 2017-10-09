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

ActiveRecord::Schema.define(version: 20171009075830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "book_id"
    t.index ["author_id"], name: "index_authors_books_on_author_id"
    t.index ["book_id"], name: "index_authors_books_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 8, scale: 2
    t.text "description"
    t.date "public_y"
    t.integer "height", limit: 2
    t.integer "weight", limit: 2
    t.integer "depth", limit: 2
    t.string "material"
    t.integer "reviews_qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "images", force: :cascade do |t|
    t.string "file"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_images_on_book_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "mark"
    t.string "comment"
    t.integer "check", default: 0
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shopping_cart_billing_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.bigint "user_id"
    t.bigint "country_id"
    t.bigint "orders_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_shopping_cart_billing_addresses_on_country_id"
    t.index ["orders_id"], name: "index_shopping_cart_billing_addresses_on_orders_id"
    t.index ["user_id"], name: "index_shopping_cart_billing_addresses_on_user_id"
  end

  create_table "shopping_cart_coupons", force: :cascade do |t|
    t.string "code"
    t.decimal "price", precision: 8, scale: 2
    t.bigint "order_id"
    t.index ["order_id"], name: "index_shopping_cart_coupons_on_order_id"
  end

  create_table "shopping_cart_credit_cards", force: :cascade do |t|
    t.bigint "number"
    t.string "name"
    t.string "expired"
    t.integer "cvv"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_cart_credit_cards_on_order_id"
  end

  create_table "shopping_cart_order_items", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price", precision: 8, scale: 2
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_shopping_cart_order_items_on_order_id"
  end

  create_table "shopping_cart_order_statuses", force: :cascade do |t|
    t.string "name"
    t.bigint "orders_id"
    t.index ["orders_id"], name: "index_shopping_cart_order_statuses_on_orders_id"
  end

  create_table "shopping_cart_orders", force: :cascade do |t|
    t.string "number"
    t.bigint "user_id"
    t.decimal "total_price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_shipping_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.bigint "user_id"
    t.bigint "country_id"
    t.bigint "orders_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_shopping_cart_shipping_addresses_on_country_id"
    t.index ["orders_id"], name: "index_shopping_cart_shipping_addresses_on_orders_id"
    t.index ["user_id"], name: "index_shopping_cart_shipping_addresses_on_user_id"
  end

  create_table "shopping_cart_shipping_methods", force: :cascade do |t|
    t.string "name"
    t.string "duration"
    t.decimal "price", precision: 8, scale: 2
    t.bigint "orders_id"
    t.index ["orders_id"], name: "index_shopping_cart_shipping_methods_on_orders_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authors_books", "authors"
  add_foreign_key "authors_books", "books"
  add_foreign_key "books", "categories"
  add_foreign_key "images", "books"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
  add_foreign_key "shopping_cart_billing_addresses", "countries"
  add_foreign_key "shopping_cart_billing_addresses", "shopping_cart_orders", column: "orders_id"
  add_foreign_key "shopping_cart_billing_addresses", "users"
  add_foreign_key "shopping_cart_coupons", "shopping_cart_orders", column: "order_id"
  add_foreign_key "shopping_cart_credit_cards", "shopping_cart_orders", column: "order_id"
  add_foreign_key "shopping_cart_order_items", "shopping_cart_orders", column: "order_id"
  add_foreign_key "shopping_cart_order_statuses", "shopping_cart_orders", column: "orders_id"
  add_foreign_key "shopping_cart_shipping_addresses", "countries"
  add_foreign_key "shopping_cart_shipping_addresses", "shopping_cart_orders", column: "orders_id"
  add_foreign_key "shopping_cart_shipping_addresses", "users"
  add_foreign_key "shopping_cart_shipping_methods", "shopping_cart_orders", column: "orders_id"
end
