# frozen_string_literal: true

class CartsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart
end
