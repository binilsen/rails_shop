# frozen_string_literal: true

#  renaming orders_items to orders_products following rails naming convention
class RenameOrdersItemsTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :orders_items, :orders_products
  end
end
