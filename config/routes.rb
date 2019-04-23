Rails.application.routes.draw do
  resources :pantry_items
  resources :neighborhoods
  resources :addresses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
