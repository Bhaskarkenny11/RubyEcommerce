Rails.application.routes.draw do
  resources :addresses
  get 'dashboard/index'
  get 'dashboard/orders_report'
  devise_for :users
  resources :categories
  resources :products
  #resources :reviews, only: [:create,:destroy,:edit, :update]
resources :reviews, controller: :reviews, only: [:create, :index, :edit,:destroy] do
      member do
        delete :destroy
      end
end
  resources :cart_line_items 
  get '/checkout', to: 'cart_line_items#checkout'
  
  resources :orders
#delete 'products/:id', to: 'products#destroy'
root  "products#index"  
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/success", to: "cart_line_items#success"
end
