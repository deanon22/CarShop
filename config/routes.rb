Rails.application.routes.draw do
  resources :receipts
  get 'parts/index'
  get 'parts/show'
  get 'parts/create'
  # get 'cars/index'
  # get 'cars/show'
  devise_for :users
  root 'welcome#index'
  resources :services
  resources :cars
  resources :parts
 
  #get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
