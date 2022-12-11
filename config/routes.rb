Rails.application.routes.draw do
  root "events#index"

  resources :new_events, only: [:new, :create]
  resources :events, only: [:index, :show, :edit, :update, :destroy]

  # sessions
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
