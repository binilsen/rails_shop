class CartsProductsController < ApplicationController
  before_action :authenticate_user!

  def add_product
    get_cart = create_cart
    get_cart = create_cart(true) if get_cart.nil?
    check_product_exist = get_cart.carts_products.find_by(product_id: params[:product_id])
    if check_product_exist
      check_product_exist.product_quantity += 1
      CartsProduct.find(check_product_exist.id).update(product_quantity: check_product_exist.product_quantity)
    else
      new_product_to_cart = CartsProduct.create(product_id: params[:product_id], cart_id: get_cart.id)
      new_product_to_cart.save
    end
    redirect_to cart_path
  end

  def remove_product
    get_cart = create_cart
    check_cart_exist = CartsProduct.find_by(cart_id: get_cart.id, product_id: params[:product_id])
    if check_cart_exist.product_quantity == 1
      CartsProduct.destroy(check_cart_exist.id)
      if CartsProduct.find_by(cart_id: get_cart.id).nil?
        Cart.destroy_by(id: get_cart.id)
      end
    end
    if check_cart_exist.product_quantity >= 1
      check_cart_exist.product_quantity -= 1
      check_cart_exist.save
    end
    redirect_to cart_path
  end
end
