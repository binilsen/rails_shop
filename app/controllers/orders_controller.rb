class OrdersController < ApplicationController
  @@user = User.first

  def index
    @orders = Order.where("user_id=?", @@user.user_id)
  end

  def show
    @order = Order.find(params[:order_id])
    @cart = Cart.find(@order.cart_id).carts_products.all
    product_list = get_cart(@order.cart_id).products
    @products = {}
    @cart.each do |item|
      @products[item.product_id] = product_list.select { |x| x if x.product_id == item.product_id }
    end
  end

  private

  def get_cart(id)
    Cart.find(id)
  end
end
