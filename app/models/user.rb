# frozen_string_literal: true

# user model for devise
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String, default: ''
  field :encrypted_password, type: String, default: ''
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: DateTime
  field :remember_created_at, type: DateTime
  index({ email: 1, reset_password_token: 1 }, { unique: true })
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
