Rails.application.routes.draw do
  get "/neighborhoods/search", to: "neighborhoods#search"
  get "/neighborhoods/find", to: "neighborhoods#find"
  
  post "/login", to: "users#login"

  resources :offers
  resources :pantry_requests
  resources :claims
  resources :neighborhoods
  resources(:users) do 
    resources :pantry_items, shallow:true
    resources :pantry_requests, shallow:true
    resources :offers, shallow:true
    resources :claims, shallow:true
    resources :neighborhoods, only: :index
    resources :neighbors, only: [:create, :delete]
    
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
