# frozen_string_literal: true

# app helper
module ApplicationHelper
  def tax(amount)
    (amount * 0.05).round
  end
end
