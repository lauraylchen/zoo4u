Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :animals, only: %i[index show] do
    resources :bookings, only: %i[new create]
  end

  get '/my_bookings', to: 'bookings#my_bookings', as: :my_bookings

  get'/my_animals', to: 'animals#my_animals', as: :my_animals
end
