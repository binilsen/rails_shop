# frozen_string_literal: true

# create cart product table with has_many:through association
class CreateShopTable < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_title
      t.integer :product_weight
      t.float :product_price
      t.timestamps
    end

    create_table :carts, &:timestamps
    create_table :carts_products do |t|
      t.belongs_to :product
      t.belongs_to :cart
      t.timestamps
    end
  end
end
