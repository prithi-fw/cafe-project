Rails.application.routes.draw do
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :menu_items
  resources :menus
  resources :users
  resources :orders
  resources :admin
  
  resources :order_items
  get "/" => "home#index"
  get "/active" => "menus#active_menus", as: :active_menus
  get "/cart" => "orders#show_cart", as: :show_cart
  post "/cart-order" => "orders#cart_to_order", as: :cart_orders
   
  post "/signin" => "sessions#create", as: :sessions
  get "/signin" => "sessions#new", as: :new_sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

end
