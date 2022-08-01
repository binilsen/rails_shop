# frozen_string_literal: true

# page helper containing methods for getting gst and converting weight
module PagesHelper
  def format_weight(product)
    "#{product.product_weight} #{product.unit.symbol}"
  end

  # def gst_included_price(price)
  #   (price * 0.05).round
  # end
end
