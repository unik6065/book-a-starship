Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'pages#profil'
  resources :starships do
    resources :rentals, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # Define a route to access rentals index page
  resources :rentals, only: %i[index]
end
