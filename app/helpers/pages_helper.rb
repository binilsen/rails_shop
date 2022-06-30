module PagesHelper
  def format_weight(weight)
    if weight < 1000
      return weight.to_s + " gm"
    end
    (weight / 1000).to_s + " kg"
  end

  def gst_included_price(price)
    (price * (1.05))
  end
end
