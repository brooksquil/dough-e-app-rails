Rails.application.routes.draw do

  root 'homepage#index'
  
  resources :order_products
  resources :orders
  resources :products
  resources :standing_orders
  resources :quantity_types
  resources :product_types
  resources :payment_types
  resources :users
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/admin_menu' => 'admin_menu#index'
  get '/customer_menu' => 'customer_menu#index'

  get 'shopping_cart', to: 'orders#show', as: 'shopping_cart'
  post 'add_to_shopping_cart', to: 'orders#add_to_cart', as: 'add_to_shopping_cart'
  get 'edit_order', to: 'orders#edit', as: 'select_payment'
  patch 'complete_order', to: 'orders#update', as: 'complete_order'
  delete 'delete_product_from_order', to: 'orders#delete_product_from_order', as: 'delete_product_from_order'
end
