# frozen_string_literal: true

# add quantity column to joining table carts_products
class AddQuantityToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts_products, :product_quantity, :integer, default: 1
  end
end
