class CartsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :user
end
