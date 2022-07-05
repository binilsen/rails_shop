class User < ApplicationRecord
  has_many :orders,dependent: :destroy
  validates :user_email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 10 }
  validates :user_mobile, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 10, maximum: 10 }
end
