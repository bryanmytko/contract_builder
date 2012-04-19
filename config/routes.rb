Auth::Application.routes.draw do
  get "log_out" => "sessions#destroy", :as =>"log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "dashboard" => "dashboard#index", :as => "dashboard"
  get "contracts/new/webready" => "contracts#webready", :as => "contracts_webready"
  get "contracts/new/professional" => "contracts#professional", :as => "contracts_professional"

  root :to => "sessions#new"
  
  resources :users
  resources :sessions
  resources :professionals
  resources :contracts
  
end
