class Cart < ApplicationRecord
  has_many :carts_products, dependent: :destroy
  has_many :products, :through => :carts_products
  has_one :order, dependent: :destroy
end
