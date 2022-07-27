# frozen_string_literal: true

class Cart
  include Mongoid::Document
  include Mongoid::Timestamps
  field :processed, type: Boolean, default: false
  field :cart_total, type: Integer, default: 0
  has_many :carts_products, dependent: :destroy
  belongs_to :user, index: true
end
