class PagesController < ApplicationController
  attr_reader :products, :cart_total
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_product
    get_cart = create_cart
    get_cart = create_cart(true) if get_cart.nil?
    check_product_exist = get_cart.carts_products.find_by(product_id: params[:product_id])
    if check_product_exist
      check_product_exist.product_quantity += 1
      CartsProduct.find(check_product_exist.id).update(product_quantity: check_product_exist.product_quantity)
    else
      new_product_to_cart = CartsProduct.create(product_id: params[:product_id], cart_id: get_cart.id, user_id: current_user.id)
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

  def cart
    get_cart = create_cart
    return if (get_cart.nil? || get_cart.carts_products.empty?)
    @cart_total = 0
    @cart = get_cart # contain the cart details
    @product_list = get_cart.carts_products #fetch the items for the cart
    @products = {} # dummy variables to set product details
    @cart = Cart.find(@cart.id) #
    @product_list.each do |product|
      @products[product.product_id] = @cart.products.select { |x| x if x.id == product.product_id }
      @cart_total += (product.product_quantity) * @products[product.product_id].first.product_price
    end
    get_cart.update(cart_total: @cart_total)
  end

  def buy_now
    new_cart = create_cart(true)
    CartsProduct.create(product_id: params[:id], cart_id: new_cart.id, user_id: current_user.id)
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

  def create_cart(flag = false)
    if flag
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.save
      @cart = Cart.last
    else
      @cart = current_user.carts.order(id: :desc).find_by(processed: false)
    end
  end
end
