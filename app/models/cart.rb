class Cart < ApplicationRecord
  has_many :carts_products, dependent: :destroy
  has_many :products, :through => :carts_products
  belongs_to :user
end
