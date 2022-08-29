# frozen_string_literal: true

# main cart model
class Cart < ApplicationRecord
  has_many :carts_products, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :products, through: :carts_products
  belongs_to :user

  def update_cart_total
    cart_total = 0
    cart_refresh
    carts_products.each do |item|
      cart_total += (item.product.product_price * item.product_quantity)
    end
    cart_total += get_tax(cart_total)
    update(cart_total:)
  end

  def tax
    get_tax(cart_total)
  end

  def cart_empty?
    carts_products.blank?
  end

  def destroy_cart
    destroy
  end

  def cart_refresh
    reload
  end

  private

  def get_tax(amount)
    (amount * 0.05).floor
  end
end
