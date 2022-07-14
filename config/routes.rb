Rails.application.routes.draw do
  root "events#index"

  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # sessions
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
