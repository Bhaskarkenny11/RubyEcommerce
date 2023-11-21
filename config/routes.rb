Rails.application.routes.draw do
  resources :addresses
  get 'dashboard/index'
  get 'dashboard/orders_report'
  devise_for :users
  resources :categories
  resources :products
  resources :reviews, only: [:create,:destroy,:edit, :update]
  resources :cart_line_items
  resources :orders
#delete 'products/:id', to: 'products#destroy'
root  "products#index"  
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
