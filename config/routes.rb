Rails.application.routes.draw do
  devise_for :users
  root to: "costumes#index"
<<<<<<< HEAD
  get "dashboard", to: "pages#dashboard"


=======
  get "profile", to: "pages#profile"
>>>>>>> master

  resources :costumes do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:update, :destroy]

end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
p
