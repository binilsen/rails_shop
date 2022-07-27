# frozen_string_literal: true

class CartsProduct
  include Mongoid::Document
  field :product_quantity, type: Integer, default: 1
  belongs_to :product, index: true
  belongs_to :cart, index: true
end
