# frozen_string_literal: true

# controller for displaying  cart
class CartsController < ApplicationController
  def index
    @cart = create_cart
    return if @cart.blank? || @cart.carts_products.blank?
  end
end
