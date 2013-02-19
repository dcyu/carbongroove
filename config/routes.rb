Carbongroove::Application.routes.draw do

  resources :goals


  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root :to => "users#new"
  root to: 'root#index'

  resources :users
  resources :sessions
  resources :receipts

  # get "sessions/new"
  # get "users/new"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

end
