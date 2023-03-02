Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "costumes#index"
  get "dashboard", to: "pages#dashboard"
  get "mycostumes", to: "pages#mycostumes"

  get "profile", to: "pages#profile"

  resources :costumes do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:update, :destroy] do
    member do
      post :accept
      post :close
    end
  end

end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
