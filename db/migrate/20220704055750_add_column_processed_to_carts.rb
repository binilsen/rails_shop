# frozen_string_literal: true

# adding processed column to cart to show status
class AddColumnProcessedToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :processed, :boolean, default: false
  end
end
