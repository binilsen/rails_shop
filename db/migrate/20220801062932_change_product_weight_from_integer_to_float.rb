# frozen_string_literal: true

# change column type to float for product weight
class ChangeProductWeightFromIntegerToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :product_weight, :float
  end
end
