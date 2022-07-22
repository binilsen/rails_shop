# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: [:registration], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'
  get '/cart', to: 'carts#index', as: :cart
  get '/users', to: 'users#index', as: :users
  get '/users/orders', to: 'orders#index', as: :orders
  get '/users/orders/:order_id', to: 'orders#show', as: :order
  get '/order', to: 'orders#place_order', as: :place_order
  get '/:id', to: 'pages#show', as: :product
  get '/buy-now/:id', to: 'orders#buy_now', as: :buy_now
  get '/add/:product_id', to: 'carts_products#add_product', as: :add_product
  get '/remove/:product_id', to: 'carts_products#remove_product', as: :remove_product

  devise_scope :user do
    get '/users/sign_up', to: 'devise/registrations#new', as: :new_user_registration
    post 'users', to: 'devise/registrations#create', as: :user_registration
  end
end
