Auth::Application.routes.draw do
  get "log_out" => "sessions#destroy", :as =>"log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "dashboard" => "dashboard#index", :as => "dashboard"
  get "contracts/new/webready" => "contracts#webready", :as => "contracts_webready"
  get "contracts/new/professional" => "contracts#professional", :as => "contracts_professional"
  
  match "contracts/edit/:id", :to => "contracts#edit", :as => "contracts_edit"
  
  match 'build/:id', :to => 'build#edit', :as => "build_edit"
  match 'build/new/:id', :to => 'build#new', :as => "build_new"
  post 'build/hourly/:id' => 'build#hourly', :as => "build_hourly"
 # match 'admin/add_professional_template', :to => 'professional_templates', :as => 'add_professional_template'
  # This route can be invoked with purchase_url(:id => product.id)
  
  root :to => "sessions#new"
  
  resources :users, :sessions, :contracts
  
  namespace :admin do
  	root :to => "home#index"
  	resources :professional_template
  	match 'professional_template/design', :to => 'professional_template#design', :as => 'professional_template_design'
	end



end
