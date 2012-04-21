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
  match 'build/hourly/:id', :to => 'build#hourly', :as => "build_hourly"
  match 'admin/add_professional_template', :to => 'admin#add_professional_template', :as => 'add_professional_template'
  match 'admin/create_professional_template', :to => 'admin#create_professional_template', :as => 'professional_templates'
  # This route can be invoked with purchase_url(:id => product.id)
  
  root :to => "sessions#new"
  
  resources :users
  resources :sessions
  #resources :professionals
  resources :contracts
  #resources :admin

end
