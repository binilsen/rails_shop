# frozen_string_literal: true

# order table creation
class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :order_total
      t.integer :order_tax
      t.integer :order_status, default: 0
      t.timestamps
    end
  end
end
