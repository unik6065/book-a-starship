Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'pages#profil'
  resources :starships do
    resources :rentals, only: %i[new create]
  end

  # Define a route to access rentals index and show page and destroy a rental
  # resources :rentals, only: %i[index show destroy]

  # Define a collection of route that show bookings from the point of view of renter and reservations from the point of view of loaner
  resources :rentals do
    resources :reviews, only: %i[new create]
    collection do
      get :bookings
      get :requests
    end
    member do
      get :accept
      get :decline
    end
  end
end
