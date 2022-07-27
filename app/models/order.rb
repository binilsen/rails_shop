# frozen_string_literal: true

class Order
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :order_status, type: Integer, default: 0
  field :total, type: Integer, default: 0
  belongs_to :user, index: true
  has_many :orders_products, dependent: :destroy
end
