# frozen_string_literal: true

# add foreign key unit_id to products
class AddUnitToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :unit, null: false, foreign_key: true
  end
end
