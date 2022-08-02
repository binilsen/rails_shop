# frozen_string_literal: true

# page helper containing methods for getting gst and converting weight
module PagesHelper
  def format_weight(product)
    "#{product.product_weight} #{product.unit.symbol}"
  end

  def user_products(cart_products)
    return if cart_products.blank?

    product_list = {}
    cart_products.each { |item| product_list[item.product_id] = item.product_quantity }
    product_list
  end
end
