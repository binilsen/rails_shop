# frozen_string_literal: true

class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :product_name, type: String
  field :product_title, type: String
  field :product_price, type: Float
  field :product_weight, type: Integer
  has_many :carts_products
  has_many :orders_products
end
