# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users, skip: [:registration], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_up', to: 'devise/registrations#new', as: :new_user_registration
    post 'users', to: 'devise/registrations#create', as: :user_registration
  end

  # root route
  root 'pages#index'
  # cart route , with route for buy now
  resources :carts, only: :show do
    member do
      get :place_order, controller: :orders
    end
  end
  # route for user+orders
  resources :users, only: :show do
    resources :orders, only: %i[show index]
  end
  # route for products + add/remove product + buy an item
  resources :products, controller: :pages, only: %i[index show] do
    member do
      post :add, controller: :carts_products
      post :remove, controller: :carts_products
      get :buy_now, controller: :orders
    end
  end

  # route for api
  namespace :api, defaults: { format: :json } do
    devise_scope :user do
      post 'users', to: 'users/registrations#create'
      post 'users/sign_in', to: 'users/sessions#create'
      delete 'users/sign_out', to: 'users/sessions#destroy'
    end
  end
end
