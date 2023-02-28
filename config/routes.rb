Rails.application.routes.draw do
  devise_for :users
  root to: "costumes#index"
  get "dashboard", to: "pages#dashboard"


  resources :users, only: %i[show new create edit update] do
    resources :costumes, only: %i[new create destroy edit update]
    resources :bookings
  end
  resources :costumes, only: %i[index show]
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
