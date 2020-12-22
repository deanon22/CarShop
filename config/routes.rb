Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  #  resources :receipts do
  #   member do
  #     delete :delete_image_attachment
  #   end
  #  end
  get 'parts/index'
  get 'parts/show'
  get 'parts/create'
  # get 'cars/index'
  # get 'cars/show'
  devise_for :users
  root 'welcome#index'
  resources :services do
    member do
      delete :delete_image_attachment
    end
  end
  resources :cars
  resources :parts
 
  #get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
