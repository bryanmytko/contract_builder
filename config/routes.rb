Auth::Application.routes.draw do

  root :to => "sessions#new"

	resources :users, :sessions, :contracts, :build, :hourly, :saved_states, :cms_selections
	resources :dashboards, :path => '/dashboard'

  get "log_out" => "sessions#destroy", :as =>"log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  
  match 'build/new/:id', :to => 'build#new', :as => "build_new"

  namespace :admin do
  	root :to => "home#index"
  	resources :professional_templates, :professional_pages
	end

end
