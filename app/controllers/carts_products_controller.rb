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
    product = get_cart.carts_products.find_by(product_id: params[:product_id])
    remove_product_from_cart(get_cart, product)
    cart_update(product, add: false) if product.product_quantity > 1
    redirect_to cart_path
  end

  private

  def check_for_product_and_add(cart)
    product = cart.carts_products.find_by(product_id: params[:product_id])
    if product
      cart_update(product)
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

  def remove_product_from_cart(cart, product)
    if product.product_quantity == 1 && (CartsProduct.destroy product.id) \
       && (CartsProduct.find_by cart_id: cart.id).nil?
      Cart.destroy_by(id: cart.id)
    end
  end
end
