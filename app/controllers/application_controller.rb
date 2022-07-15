class ApplicationController < ActionController::Base
  before_action :authenticate_user!
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
