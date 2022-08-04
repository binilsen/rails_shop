# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_products, dependent: :destroy
  has_many :products, through: :orders_products

  def tax
    get_tax(total)
  end

  def get_tax(amount)
    (amount * 0.05).floor
  end
end
