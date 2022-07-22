# frozen_string_literal: true

# page helper containing methods for getting gst and converting weight
module PagesHelper
  def format_weight(weight)
    return "#{weight} GM" if weight < 1000

    "#{weight / 1000} KG"
  end

  def gst_included_price(price)
    (price * 1.05).round
  end
end
