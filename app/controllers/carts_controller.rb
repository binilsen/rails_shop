# frozen_string_literal: true

# controller for displaying  cart
class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    return if @cart.blank? || @cart.carts_products.blank?

    respond_to do |format|
      format.json { render json: @cart.as_json(include: %i[products carts_products products.unit]) }
      format.html
    end
  end
end
