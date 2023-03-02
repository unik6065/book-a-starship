Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :starships do
    resources :rentals, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # Define a route to access rentals index page
  resources :rentals, only: %i[index show]
  # Define a route to accept and decline a rental
  patch "rentals/:id/accept", to: "rentals#accept", as: :accept_rental
  patch "rentals/:id/decline", to: "rentals#decline", as: :decline_rental
end
