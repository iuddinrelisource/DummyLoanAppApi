Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  post '/admin/registrations', to: 'admin_registrations#create'
  post '/admin/login', to: 'admin_sessions#create'
  post '/dealer/registrations', to: 'dealer_registrations#create'
  post '/dealer/login', to: 'dealer_sessions#create'
  resources :makes 
  resources :models
  resources :makes 
  get '/bike_lease_applications', to: 'bike_lease_applications#index'
  get '/bike_lease_applications/:id', to: 'bike_lease_applications#show'
  post '/bike_lease_applications', to: 'bike_lease_applications#create'
  post '/bike_lease_applications/:id/submit', to: 'bike_lease_applications#submit_application'
  post '/bike_lease_applications/:id/lesse', to: 'bike_lease_applications#createlesse'
  post '/bike_lease_applications/:id/colesse', to: 'bike_lease_applications#createcolesse'
  get '/constant_lists', to: 'constants#lists'
  # Defines the root path route ("/")
  # root "articles#index"
end
