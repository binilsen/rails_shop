# frozen_string_literal: true

# unit table to store common units
class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :symbol
    end
  end
end
