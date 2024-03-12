Rails.application.routes.draw do
  devise_for :users
  get 'balls/position'  => 'balls#position'

  resources :users, only: [:show]  
   resources :balls do
   resources :likes, only: [:create, :destroy]
   resources :comments, only: [:create]  
  end

  root 'balls#index'
  
end
