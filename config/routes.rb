Rails.application.routes.draw do
  resources :offers
  resources :pantry_requests
  resources :claims
  resources :neighborhoods
  resources(:users, shallow:true) do 
    resources :pantry_items
    resources :pantry_requests
    resources :neighborhoods
    resources :offers
    resources :claims
    
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
