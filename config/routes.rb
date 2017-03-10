Rails.application.routes.draw do

  devise_for :users
  root to: 'visitors#index'
  resources :users
  resources :sessions, only: [:new, :create, :delete]
  resources :players

  resources :games, only: [:index]

  get "/games/:game_id/players/:player_id/decline", to: 'players#decline'
  get "/games/:game_id/players/:player_id/confirm", to: 'players#confirm'
  get "/teams/:team_id/players/:player_id/core", to: 'players#core'

  get "teams/:team_id/players/:id/remove", to: 'players#remove'

  get "/teams/:team_id/games/:game_id/notify", to: 'games#notify'

  resources :teams do
    resources :games
    resources :rosters, only: [:create, :delete]
  	resources :players
  end


  # get 'twilio/voice' => 'twilio#trigger_sms_alerts'
  post 'twilio/voice' => 'twilio#response_message'



end
