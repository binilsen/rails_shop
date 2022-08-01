# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :carts_products
  has_many :carts, through: :carts_products

  has_many :orders_products
  has_many :orders, through: :orders_products
  belongs_to :unit
end
