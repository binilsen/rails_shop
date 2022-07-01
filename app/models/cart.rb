class Cart < ApplicationRecord
    has_many :carts_products
    has_many :products,:through=>:carts_products
end
