Rails.application.routes.draw do
  resources :user_events
  resources :user_event_awards
  resources :awards
  resources :events
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
