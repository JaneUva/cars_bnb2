Rails.application.routes.draw do
  devise_for :users
  root to: 'cars#index'
  resources :cars, only: [:index, :show] do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:show, :destroy, :index]
end
