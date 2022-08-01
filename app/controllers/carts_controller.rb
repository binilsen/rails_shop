# frozen_string_literal: true

# controller for displaying  cart
class CartsController < ApplicationController
  def index
    current_cart = create_cart
    return if current_cart.blank? || current_cart.carts_products.blank?

    @cart_total = 0
    @cart = current_cart
    @cart.carts_products.each do |item|
      @cart_total += (item.product.product_price * item.product_quantity)
    end
    @cart_total += get_tax(@cart_total)
    current_cart.update(cart_total: @cart_total)
  end

  private

  def get_tax(amount)
    (amount * 0.05).round
  end
end
