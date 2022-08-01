# frozen_string_literal: true

# foreign key for orders_products
class AddForeignKeyToOrdersProducts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :orders_products, :orders
    add_foreign_key :orders_products, :products
  end
end
