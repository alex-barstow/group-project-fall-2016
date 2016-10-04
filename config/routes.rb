Rails.application.routes.draw do
  root 'cheeses#index'

  devise_for :users, :controllers => { registrations:
    'registrations' }

  resources :cheeses, only: [:index, :show]
end
