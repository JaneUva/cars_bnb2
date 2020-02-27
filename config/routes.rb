Rails.application.routes.draw do
  devise_for :users
  root to: 'cars#index'
  resources :cars, only: [:index, :show, :create, :new] do
    resources :bookings, only: :create
    resources :reviews, only: :create
  end
  resources :bookings, only: [:show, :destroy, :index]
end
