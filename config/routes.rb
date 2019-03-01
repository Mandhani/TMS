Rails.application.routes.draw do
  resources :booking_waitlists
  resources :tour_interest_lists
  match '/bookings/option', to: 'bookings#option', via: 'get'
  resources :bookings
  resources :tours
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
end
