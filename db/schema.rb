# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_04_060648) do
  create_table "carts", primary_key: "cart_id", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "processed", default: false
    t.integer "cart_total", default: 0
  end

  create_table "carts_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_quantity", default: 1
    t.index ["cart_id"], name: "index_carts_products_on_cart_id"
    t.index ["product_id"], name: "index_carts_products_on_product_id"
  end

  create_table "orders", primary_key: "order_id", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "user_id"
    t.integer "order_total"
    t.integer "order_tax"
    t.integer "order_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", primary_key: "product_id", force: :cascade do |t|
    t.string "product_name"
    t.text "product_title"
    t.integer "product_weight"
    t.float "product_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string "user_first_name", null: false
    t.string "user_last_name", null: false
    t.string "user_email", null: false
    t.string "user_mobile", null: false
    t.text "user_address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_email"], name: "index_users_on_user_email"
    t.index ["user_mobile"], name: "index_users_on_user_mobile"
  end

end
