Rails.application.routes.draw do
  
  devise_for :users

  root to: 'visitors#index'
  
  resources :users

  resources :players

  resources :teams do
  	resources :games
  	resources :players
  end
  
end
