# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_824_071_752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'carts', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'processed', default: false
    t.integer 'cart_total', default: 0
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_carts_on_user_id'
  end

  create_table 'carts_products', force: :cascade do |t|
    t.bigint 'product_id'
    t.bigint 'cart_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'product_quantity', default: 1
    t.index ['cart_id'], name: 'index_carts_products_on_cart_id'
    t.index ['product_id'], name: 'index_carts_products_on_product_id'
  end

  create_table 'jwt_denylists', force: :cascade do |t|
    t.string 'jti', null: false
    t.datetime 'exp', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['jti'], name: 'index_jwt_denylists_on_jti'
  end

  create_table 'orders', force: :cascade do |t|
    t.bigint 'user_id'
    t.integer 'order_status', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'total', default: 0
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'orders_products', force: :cascade do |t|
    t.bigint 'order_id'
    t.bigint 'product_id'
    t.integer 'quantity'
    t.index ['order_id'], name: 'index_orders_products_on_order_id'
    t.index ['product_id'], name: 'index_orders_products_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'product_name'
    t.text 'product_title'
    t.float 'product_weight'
    t.float 'product_price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'unit_id', null: false
    t.index ['unit_id'], name: 'index_products_on_unit_id'
  end

  create_table 'units', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'symbol'
    t.index ['name'], name: 'index_units_on_name', unique: true
    t.index ['symbol'], name: 'index_units_on_symbol'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'carts', 'users'
  add_foreign_key 'carts_products', 'carts'
  add_foreign_key 'carts_products', 'products'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'orders_products', 'orders'
  add_foreign_key 'orders_products', 'products'
  add_foreign_key 'products', 'units'
end
