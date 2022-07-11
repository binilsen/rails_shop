class PagesController < ApplicationController
  attr_reader :products, :cart_total
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
