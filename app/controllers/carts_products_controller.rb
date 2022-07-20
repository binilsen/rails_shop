# frozen_string_literal: true

# controller managing cart item quantity
class CartsProductsController < ApplicationController
  def add_product
    get_cart = create_cart
    get_cart = create_cart(flag: true) if get_cart.nil?
    check_for_product_and_add(get_cart)
    redirect_to cart_path
  end

  def remove_product
    get_cart = create_cart
    check_product_exist = get_cart.carts_products.find_by(product_id: params[:product_id])
    Cart.destroy_by(id: get_cart.id) if check_product_exist.product_quantity == 1
    cart_update(check_product_exist, add: false) if check_product_exist.product_quantity > 1
    redirect_to cart_path
  end

  private

  def check_for_product_and_add(cart)
    check_product_exist = cart.carts_products.find_by(product_id: params[:product_id])
    if check_product_exist
      cart_update(check_product_exist)
    else
      CartsProduct.create(product_id: params[:product_id], cart_id: cart.id)
    end
  end

  def cart_update(product, add: true)
    if add
      product.update(product_quantity: product.product_quantity + 1)
    else
      product.update(product_quantity: product.product_quantity - 1)
    end
  end
end
