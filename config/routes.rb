Store::Application.routes.draw do
  
#  map.current_cart 'cart', :controller => 'carts', :action => 'show', :id => 'current'
  get '/order/express' => "orders#express", :as => :pay
  
  resources :orders, :new => { :express => :get }
  resources :line_items
  resources :carts
  resources :products
  resources :categories
  
   root :to => 'products#index'
end