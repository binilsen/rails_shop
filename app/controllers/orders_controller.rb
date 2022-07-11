class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(id: :desc)
  end

  def show
    @order = Order.find(params[:order_id])
    @cart = Cart.find(@order.cart_id).carts_products.all
  end

  def buy_now
    new_cart = create_cart(true)
    CartsProduct.create(product_id: params[:id], cart_id: new_cart.id)
    redirect_to cart_path
  end

  def place_order
    get_cart = create_cart
    Order.create(id: Time.now.to_i, cart_id: get_cart.id, order_total: get_cart.cart_total, order_tax: get_tax(get_cart.cart_total), user_id: current_user.id)
    flash[:status] = "Order Successfully Placed." if get_cart.update(processed: true)
    redirect_to root_path
  end

  private

  def get_tax(amount)
    return ((amount * 1.05) - amount).round
  end

  def get_cart(id)
    Cart.find(id)
  end
end
