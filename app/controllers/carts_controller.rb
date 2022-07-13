class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    current_cart = create_cart
    return if (current_cart.nil? || current_cart.carts_products.empty?)
    @cart_total = 0
    @products = current_cart
    @products.carts_products.each do |item|
      @cart_total += (item.product.product_price * item.product_quantity)
    end
    @cart_total += get_tax(@cart_total)
    current_cart.update(cart_total: (@cart_total))
  end

  private

  def get_tax(amount)
    return ((amount * 1.05) - amount).round
  end
end
