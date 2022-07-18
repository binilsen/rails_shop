module ApplicationHelper
  def order_gst(amount)
    (amount - (amount / (1.05))).round
  end
end
