Carbongroove::Application.routes.draw do

  #post "/users/:id" => "Intervals#create"
  resources :users

  get "users/:id/:full_date" => "Users#show"
  post '/users/:id', :controller => "Users", :action => "add_account"

  resources :goals

  match 'auth/facebook/callback', to: 'sessions#create_facebook'
  match 'auth/twitter/callback', to: 'sessions#create_twitter'
  match 'auth/failure', to: redirect('/')

  root to: 'root#index'

  resources :sessions
  resources :receipts

  # get "sessions/new"
  # get "users/new"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

end
