Rails.application.routes.draw do
  resources :trading_systems
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :trading_systems, :trade_instances
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'trading_systems#index'
end
