# frozen_string_literal: true

# user model for devise
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data[:email]).first

    # if it is a new user then create a new user and set a random token as
    # password as they never use password for logging
    user ||= User.create(email: data[:email], password: Devise.friendly_token[0, 20])
    user
  end
end
