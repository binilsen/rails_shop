class RemoveCartIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :orders,:carts
    remove_column :orders, :cart_id
  end
end
