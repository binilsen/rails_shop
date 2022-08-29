# frozen_string_literal: true

# controller managing cart item quantity
class CartsProductsController < ApplicationController
  protect_from_forgery with: :null_session, if: :json_request?
  before_action :find_cart

  def add
    if @product
      @product.update_quantity(add: true)
    else
      @product = CartsProduct.create(product_id: params[:id], cart_id: @cart.id)
    end
    @cart.update_cart_total
    respond_to do |format|
      format.json do
        render json: { quantity: @product.quantity,
                       cart: @cart.as_json(include: { products: { include: :unit }, carts_products: {} }) }
      end
      format.html { redirect_to carts_path }
      format.js
    end
  end

  def remove
    @remove_product = @product.delete_product if @product.product_quantity == 1
    @is_cart_empty = delete_cart if @cart.cart_empty?
    @product.update_quantity(add: false) if @product.product_quantity > 1
    @cart.update_cart_total unless @cart.cart_empty?
    respond_to do |format|
      format.json do
        render json: { quantity: @product.quantity, remove: @remove_product,
                       cart: @cart.as_json(include: { products: { include: :unit }, carts_products: {} }) }
      end
      format.html { redirect_to carts_path }
      format.js { render :add }
    end
  end

  private

  def find_cart
    @cart = create_cart
    @cart = create_cart(flag: true) if @cart.blank?
    @product = @cart.carts_products.find_by(product_id: params[:id])
  end

  def delete_cart
    @cart.destroy_cart
    session.delete(:cart_id)
  end

  def json_request?
    request.format.json?
  end
end
