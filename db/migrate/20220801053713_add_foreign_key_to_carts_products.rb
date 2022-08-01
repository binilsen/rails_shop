# frozen_string_literal: true

# foreign key for carts_products
class AddForeignKeyToCartsProducts < ActiveRecord::Migration[7.0]
  def change
    # foreign key for orders_products
    add_foreign_key :carts_products, :products
    add_foreign_key :carts_products, :carts
  end
end
