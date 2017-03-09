Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :players

  resources :teams do 
  	resources :games
  	resources :players
  end
end
