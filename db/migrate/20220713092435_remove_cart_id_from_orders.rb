# frozen_string_literal: true

# removing cart id from order as cart get deleted once order placed
class RemoveCartIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :orders, :carts
    remove_column :orders, :cart_id
  end
end
