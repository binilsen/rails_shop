class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order(id: :desc)
  end

  def show
    @order = Order.find(params[:order_id])
    @cart = @order.orders_products.all
  end

  def buy_now
    new_cart = create_cart(true)
    CartsProduct.create(product_id: params[:id], cart_id: new_cart.id)
    redirect_to cart_path
  end

  def place_order
    get_cart = create_cart
    order = Order.create(id: Time.now.to_i, user_id: current_user.id, total: get_cart.cart_total)
    products = get_cart.carts_products
    products.each do |cart_item|
      OrdersProduct.create(order_id: order.id, product_id: cart_item.product_id, quantity: cart_item.product_quantity)
    end
    flash[:status] = "Order Successfully Placed." if get_cart.update(processed: true)
    get_cart.destroy
    redirect_to root_path
  end

  private

  def get_cart(id)
    Cart.find(id)
  end
end
