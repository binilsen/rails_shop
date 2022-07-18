class RemoveColumnsFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :order_total
    remove_column :orders, :order_tax
  end
end
