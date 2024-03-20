Rails.application.routes.draw do
  devise_for :users
  get 'balls/position'  => 'balls#position'
  get 'balls/kisoku'  => 'balls#kisoku'
  get 'balls/score'  => 'balls#score'
  get 'balls/foul'  => 'balls#foul'
  get 'balls/vio'  => 'balls#vio'
  get 'balls/court'  => 'balls#court'
  get 'balls/other'  => 'balls#other'



  get 'balls/aruaru'  => 'balls#aruaru'
  

  resources :users, only: [:show]  
   resources :balls do
   resources :likes, only: [:create, :destroy]
   resources :comments, only: [:create]  
  end

  root 'balls#index'
  
end
