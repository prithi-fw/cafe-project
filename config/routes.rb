Rails.application.routes.draw do
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :menu_items
  resources :menus
  resources :users
  resources :orders
  resources :admin
  get "/cart" => "orders#show_cart", as: :cart_orders

  resources :order_items
  post "/signin" => "sessions#create", as: :sessions
  get "/signin" => "sessions#new", as: :new_sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

end
