# frozen_string_literal: true

class OrdersProduct
  include Mongoid::Document
  field :quantity, type: Integer
  belongs_to :order, index: true
  belongs_to :product, index: true
end
