Rails.application.routes.draw do

  devise_for :users
  root to: 'visitors#index'
  resources :users
  resources :sessions, only: [:new, :create, :delete]
  resources :players

  resources :games, only: [:index]
  resources :rosters, only: [:create]

  get "/games/:game_id/players/:player_id/decline", to: 'players#decline'
  get "/games/:game_id/players/:player_id/confirm", to: 'players#confirm'

  resources :teams do
  	resources :games
  	resources :players
  end

end
