Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :starships
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # Define a route to access rentals index page
  resources :rentals, only: [:index]
end
