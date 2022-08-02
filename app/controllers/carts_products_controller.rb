# frozen_string_literal: true

# controller managing cart item quantity
class CartsProductsController < ApplicationController
  def add
    cart = create_cart
    cart = create_cart(flag: true) if cart.blank?
    check_and_add(cart)
    redirect_back fallback_location: root_path
  end

  def remove
    cart = create_cart
    product = cart.carts_products.find_by(product_id: params[:id])
    remove_from_cart(cart, product)
    update_quantity(product, add: false) if product.product_quantity > 1
    redirect_back fallback_location: root_path
  end

  private

  def check_and_add(cart)
    product = cart.carts_products.find_by(product_id: params[:id])
    if product
      update_quantity(product)
    else
      CartsProduct.create(product_id: params[:id], cart_id: cart.id)
    end
  end

  def remove_from_cart(cart, product)
    if product.product_quantity == 1 && (CartsProduct.destroy product.id) \
       && (CartsProduct.find_by cart_id: cart.id).blank?
      Cart.destroy_by(id: cart.id)
      session.delete(:cart_id)
    end
  end

  def update_quantity(product, add: true)
    if add
      product.update(product_quantity: product.product_quantity + 1)
    else
      product.update(product_quantity: product.product_quantity - 1)
    end
  end
end
