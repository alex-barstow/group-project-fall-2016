Rails.application.routes.draw do
  root 'cheeses#index'

  devise_for :users, controllers: { registrations:
    'registrations' }

  resources :reviews, only: [] do
    resources :votes, only: [:create]
  end

  resources :cheeses do
    resources :reviews, only: [:create]
  end
end
