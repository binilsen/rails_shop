# frozen_string_literal: true

# adding foreign key in cart table from user
class AddReferenceToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :user, null: false, foreign_key: true
  end
end
