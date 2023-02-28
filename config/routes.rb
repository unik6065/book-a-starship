Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # Define a nested route in starship for the rental index page
  resources :starships do
    resources :rentals, only: [:index]
  end
end
