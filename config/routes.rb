Rails.application.routes.draw do
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  put "menus/edit_menu_details" => "menus#edit_menu_details", as: :edit_menu_details
  put "menu_item/edit_menu_items_details" => "menu_items#edit_menu_item_details", as: :edit_menu_item_details
     
  get "/" => "home#index"
  resources :menu_items
  resources :menus
  resources :users
  get "/orders/pending" => "orders#pending", as: :pending_orders

  resources :orders
  resources :admin
  resources :order_items
  get "/" => "home#index"
  post "/cart" => "orders#cart"

  get "/active" => "menus#active_menus", as: :active_menus
  
  post "/signin" => "sessions#create", as: :sessions
  get "/signin" => "sessions#new", as: :new_sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

end
