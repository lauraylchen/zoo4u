Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :animals, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end

  # Custom Routes
  get '/my_bookings', to: 'bookings#my_bookings', as: :my_bookings

  get '/my_animals', to: 'animals#my_animals', as: :my_animals

  get '/user_profile', to: 'pages#user_profile', as: :user_profile
  patch '/user_profile', to: 'pages#update_user', as: :update_user

  # Update
  patch '/animals/:id', to: 'animals#update', as: :update_animal
  patch '/bookings/:booking_id', to: 'bookings#update', as: :update_booking
end
