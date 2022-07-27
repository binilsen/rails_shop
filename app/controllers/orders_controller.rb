# frozen_string_literal: true

# controller for managing user  order
class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order(id: :desc)
  end

  def show
    @order = Order.find_by(id: params[:order_id])
    @cart = @order.orders_products.all
  end

  def buy_now
    new_cart = create_cart(flag: true)
    CartsProduct.create(product_id: params[:id], cart_id: new_cart.id)
    redirect_to cart_path
  end

  def place_order
    get_cart = create_cart
    order = Order.create(user_id: current_user.id, total: get_cart.cart_total)
    add_order_products(get_cart.carts_products, order)
    flash[:status] = 'Order Successfully Placed.' if get_cart.update(processed: true)
    get_cart.destroy
    redirect_to root_path
  end

  private

  def add_order_products(cart_items, order)
    cart_items.each do |cart_item|
      OrdersProduct.create(order_id: order.id, product_id: cart_item.product_id, quantity: cart_item.product_quantity)
    end
  end
end
