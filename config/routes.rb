Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#index"
  get "/cart", to: "pages#cart", as: :cart
  get "/account",to: "accounts#index",as: :account
  get "/account/orders",to: "orders#index",as: :orders
  get "/account/orders/:order_id",to: "orders#show",as: :order
  get "/order",to: "pages#place_order",as: :place_order
  get "/:id", to: "pages#show", as: :product
  get "/buy-now/:id",to: "pages#buy_now",as: :buy_now
  get "/add/:product_id", to: "pages#add_product", as: :add_product
  get "/remove/:product_id", to: "pages#remove_product", as: :remove_product
end
