# frozen_string_literal: true

# cart quantity controlling model
class CartsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def product_price
    product_quantity * product.product_price
  end

  def update_quantity(add: true)
    if add
      self.product_quantity += 1
    else
      self.product_quantity -= 1
    end
    save
  end

  def quantity
    product_quantity
  end

  def delete_product
    destroy
  end
end
