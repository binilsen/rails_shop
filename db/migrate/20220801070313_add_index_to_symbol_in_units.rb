# frozen_string_literal: true

#  add index to symbol column
class AddIndexToSymbolInUnits < ActiveRecord::Migration[7.0]
  def change
    add_index :units, :symbol
  end
end
