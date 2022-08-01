# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_products, dependent: :destroy
  has_many :products, through: :orders_products
end
