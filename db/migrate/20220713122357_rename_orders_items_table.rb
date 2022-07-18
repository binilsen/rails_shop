class RenameOrdersItemsTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :orders_items, :orders_products
  end
end
