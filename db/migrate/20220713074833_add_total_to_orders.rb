# frozen_string_literal: true

# adding order total field including order tax
class AddTotalToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :total, :integer, default: 0
  end
end
