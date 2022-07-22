# frozen_string_literal: true

# creating joining table for order <=> product association
class CreateOrdersItem < ActiveRecord::Migration[7.0]
  def change
    create_table :orders_items do |t|
      t.belongs_to :order
      t.belongs_to :product
      t.integer :quantity
    end
  end
end
