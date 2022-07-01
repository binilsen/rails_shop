class Product < ApplicationRecord
    has_many :carts_products
    has_many :carts,:through=>:carts_products
end
