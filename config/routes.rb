Rails.application.routes.draw do
  root 'cheeses#index'

  devise_for :users, controllers: { registrations:
    'registrations' }

  resources :reviews, only: [:destroy] do
    resources :votes, only: [:create]
  end

  resources :cheeses do
    resources :reviews, only: [:create]
  end

  resources :users
end
